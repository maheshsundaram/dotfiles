-- lua/plugins/linting.lua - Linting Configuration with nvim-lint

local lint = require("lint")

-- Helper function to check if a command exists
local function command_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Helper function to check if a project has eslint config
local function has_eslint_config(ctx)
  local eslint_configs = {
    ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json", ".eslintrc",
    "package.json" -- package.json might contain eslintConfig field
  }
  
  for _, config in ipairs(eslint_configs) do
    if vim.fs.find({ config }, { path = ctx.filename, upward = true })[1] ~= nil then
      return true
    end
  end
  
  return false
end

-- Helper function to safely get linters for a filetype
local function get_linters_for_ft(ft)
  local linters = lint.linters_by_ft[ft] or {}
  local available_linters = {}
  
  for _, linter in ipairs(linters) do
    -- Check if the linter is available and properly configured
    local linter_cmd = lint.linters[linter] and lint.linters[linter].cmd
    if type(linter_cmd) == "function" then
      linter_cmd = linter_cmd()
    end
    
    if linter_cmd and command_exists(linter_cmd) then
      table.insert(available_linters, linter)
    end
  end
  
  return available_linters
end

-- Configure linters by filetype
lint.linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  vue = { "eslint" },
  python = { "ruff" },  -- Using ruff instead of flake8 for better performance
}

-- Configure ESLint
lint.linters.eslint = {
  condition = function(ctx)
    -- Only use eslint in non-Deno projects with eslint config
    return vim.fs.find({ "deno.json", "deno.jsonc" }, { path = ctx.filename, upward = true })[1] == nil
      and has_eslint_config(ctx)
  end,
  -- Use local eslint if available
  cmd = function()
    local local_eslint = vim.fn.getcwd() .. "/node_modules/.bin/eslint"
    if command_exists(local_eslint) then
      return local_eslint
    elseif command_exists("eslint") then
      return "eslint"
    elseif command_exists("eslint_d") then
      return "eslint_d"
    end
    return nil  -- Return nil if eslint is not available
  end,
}

-- Set up autocommands for running linters
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    -- Only run linters that are available for this filetype
    local available_linters = get_linters_for_ft(vim.bo.filetype)
    if #available_linters > 0 then
      lint.try_lint(available_linters)
    end
  end,
})

-- Command to manually trigger linting
vim.api.nvim_create_user_command("Lint", function()
  local available_linters = get_linters_for_ft(vim.bo.filetype)
  if #available_linters > 0 then
    lint.try_lint(available_linters)
  else
    vim.notify("No linters available for " .. vim.bo.filetype, vim.log.levels.WARN)
  end
end, {})
