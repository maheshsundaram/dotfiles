-- lua/plugins/linting.lua - Linting Configuration with nvim-lint

local lint = require("lint")

-- Helper function to check if a command exists
local function command_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Debounce mechanism to prevent too many concurrent linting processes
local debounce_timers = {}
local function debounced_lint(bufnr, linters, delay)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  delay = delay or 300 -- Default delay in ms
  
  -- Cancel any existing timer for this buffer
  if debounce_timers[bufnr] then
    vim.loop.timer_stop(debounce_timers[bufnr])
    debounce_timers[bufnr] = nil
  end
  
  -- Create a new timer
  local timer = vim.loop.new_timer()
  debounce_timers[bufnr] = timer
  
  -- Schedule the linting after the delay
  timer:start(delay, 0, vim.schedule_wrap(function()
    -- Clear the timer reference
    debounce_timers[bufnr] = nil
    
    -- Only lint if the buffer still exists
    if vim.api.nvim_buf_is_valid(bufnr) then
      -- Use pcall to catch any errors
      pcall(function() 
        if linters then
          lint.try_lint(linters, { bufnr = bufnr })
        else
          lint.try_lint(nil, { bufnr = bufnr })
        end
      end)
    end
  end))
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
  -- Return empty if filetype is empty or nil
  if not ft or ft == "" then
    return {}
  end
  
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
  -- Add args to limit memory usage and file handles
  args = function()
    return {
      "--format", "json",
      "--max-warnings", "100",
      "--no-eslintrc", -- Use only configuration files
      "--no-ignore", -- Don't use ignore files
      "--cache", -- Use cache to improve performance
      "-" -- Read from stdin
    }
  end,
  -- Limit stdin size
  stdin = true,
  stdin_filename = function(_, bufname)
    return bufname
  end,
  -- Increase timeout to prevent issues
  timeout = 5000, -- 5 seconds
}

-- Set up autocommands for running linters
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Only run on BufWritePost to reduce frequency
vim.api.nvim_create_autocmd("BufWritePost", {
  group = lint_augroup,
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local ft = vim.bo[bufnr].filetype
    if ft == "" then return end -- Skip if filetype is empty
    
    local available_linters = get_linters_for_ft(ft)
    if #available_linters > 0 then
      -- Use the debounced linting with a longer delay
      debounced_lint(bufnr, available_linters, 500)
    end
  end,
})

-- Command to manually trigger linting
vim.api.nvim_create_user_command("Lint", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  if ft == "" then
    vim.notify("No filetype detected", vim.log.levels.WARN)
    return
  end
  
  local available_linters = get_linters_for_ft(ft)
  if #available_linters > 0 then
    vim.notify("Linting " .. ft .. " with " .. table.concat(available_linters, ", "), vim.log.levels.INFO)
    debounced_lint(bufnr, available_linters, 0) -- Run immediately for manual command
  else
    vim.notify("No linters available for " .. ft, vim.log.levels.WARN)
  end
end, {})

-- Override the lint.try_lint function to add error handling and resource limits
local original_try_lint = lint.try_lint
lint.try_lint = function(linters, opts)
  opts = opts or {}
  
  -- Set a maximum number of concurrent linting processes
  local max_concurrent = 2
  local current_count = 0
  
  -- Check if we're already at the limit
  for _, timer in pairs(debounce_timers) do
    if timer then
      current_count = current_count + 1
    end
  end
  
  if current_count >= max_concurrent then
    vim.schedule(function()
      vim.api.nvim_echo({{"Skipping lint: too many concurrent processes", "Comment"}}, false, {})
    end)
    return
  end
  
  -- Wrap the original function in pcall to catch errors
  local ok, err = pcall(function()
    original_try_lint(linters, opts)
  end)
  
  if not ok then
    -- Log the error but don't display it to the user to avoid interrupting workflow
    vim.schedule(function()
      vim.api.nvim_echo({{"Linting error (suppressed): " .. tostring(err), "Comment"}}, false, {})
    end)
  end
end

-- Clean up any lingering timers when Neovim exits
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    for _, timer in pairs(debounce_timers) do
      if timer then
        vim.loop.timer_stop(timer)
      end
    end
    debounce_timers = {}
  end,
})
