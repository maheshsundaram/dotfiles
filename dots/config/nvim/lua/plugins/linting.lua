-- lua/plugins/linting.lua - Linting Configuration with nvim-lint

local lint = require("lint")

lint.linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  vue = { "eslint" },
  python = { "ruff" },  -- Using ruff instead of flake8 for better performance
}

-- Configure linters
-- Configure ESLint
lint.linters.eslint = {
  condition = function(ctx)
    -- Only use eslint in non-Deno projects
    return vim.fs.find({ "deno.json", "deno.jsonc" }, { path = ctx.filename, upward = true })[1] == nil
  end,
  -- Use local eslint if available
  cmd = function()
    local local_eslint = vim.fn.getcwd() .. "/node_modules/.bin/eslint"
    if vim.fn.executable(local_eslint) == 1 then
      return local_eslint
    end
    return "eslint"
  end,
}

-- Set up autocommands for running linters
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

-- Command to manually trigger linting
vim.api.nvim_create_user_command("Lint", function()
  lint.try_lint()
end, {})
