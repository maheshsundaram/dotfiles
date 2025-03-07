-- lua/plugins/fzf-lua.lua - FZF-Lua Configuration (replacing telescope.lua)

local fzf = require('fzf-lua')

-- Setup fzf-lua with appropriate configuration
fzf.setup({
  -- Display settings
  winopts = {
    height = 0.85,            -- Window height
    width = 0.80,             -- Window width
    row = 0.35,               -- Window row position (0=top, 1=bottom)
    col = 0.50,               -- Window column position (0=left, 1=right)
    border = 'rounded',       -- Border style (rounded/double/single/shadow/none)
    preview = {
      border = 'border',      -- Border style for preview window
      wrap = 'nowrap',        -- Wrap preview content
      hidden = 'nohidden',    -- Hidden by default, show with '?'
      vertical = 'down:45%',  -- Preview layout, down takes 45% of screen
      horizontal = 'right:60%', -- Preview to the right taking 60% of width
      layout = 'flex',        -- Flex layout adjusts based on window width
      flip_columns = 120,     -- Flip to horizontal when width < 120 cols
    },
  },
  
  -- General settings
  keymap = {
    -- These keys work in fzf buffer (pressed when fzf popup is open)
    fzf = {
      ["CTRL-q"] = "select-all+accept", -- Select all matches and accept
      ["CTRL-a"] = "toggle-all",        -- Toggle selection
      ["CTRL-u"] = "preview-page-up",   -- Scroll preview up
      ["CTRL-d"] = "preview-page-down", -- Scroll preview down
    },
    -- These keys are passed directly to the terminal running fzf
    builtin = {
      ["<C-c>"] = "abort",              -- Close without selecting
      ["<C-j>"] = "move-selection-next",  -- Move selection down
      ["<C-k>"] = "move-selection-prev",  -- Move selection up
    },
  },
  
  -- Files finder configuration (like fzf.vim's :Files)
  files = {
    prompt = 'Files❯ ',
    fd_opts = "--color=never --type f --hidden --follow --exclude .git --exclude node_modules",
    git_icons = true,           -- Show git icons
    file_icons = true,          -- Show file icons
    color_icons = true,         -- Colorize file icons
    actions = {
      ["default"] = fzf.actions.file_edit,
      ["ctrl-s"] = fzf.actions.file_split,
      ["ctrl-v"] = fzf.actions.file_vsplit,
      ["ctrl-t"] = fzf.actions.file_tabedit,
    },
  },
  
  -- Buffers finder (like fzf.vim's :Buffers)
  buffers = {
    prompt = 'Buffers❯ ',
    file_icons = true,         -- Show file icons
    color_icons = true,        -- Colorize file icons
    sort_lastused = true,      -- Sort by most recently used
    actions = {
      ["default"] = fzf.actions.buf_edit,
      ["ctrl-s"] = fzf.actions.buf_split,
      ["ctrl-v"] = fzf.actions.buf_vsplit,
      ["ctrl-t"] = fzf.actions.buf_tabedit,
    },
  },
  
  -- Live grep configuration
  grep = {
    prompt = 'Grep❯ ',
    input_prompt = 'Search for❯ ',
    git_icons = true,          -- Show git icons
    file_icons = true,         -- Show file icons
    color_icons = true,        -- Colorize file icons
    rg_opts = "--hidden --column --line-number --no-heading " ..
              "--color=always --smart-case -g '!{.git,node_modules}/*'",
    actions = {
      ["default"] = fzf.actions.file_edit,
      ["ctrl-q"] = fzf.actions.file_sel_to_qf,
    },
  },
  
  -- LSP configurations
  lsp = {
    prompt = '❯ ',
    file_icons = true,
    color_icons = true,
    git_icons = true,
    symbols = {
      symbol_fmt = "%s [%s]", -- custom symbol formatter
    },
  },
})

-- Key mappings - similar to your fzf.vim mappings
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<C-f>', fzf.files, opts)
map('n', '<C-b>', fzf.buffers, opts)
map('n', '<C-g>', function() fzf.files({ cwd = "~/src/github.com/" }) end, opts)

-- Additional useful FZF-Lua mappings
map('n', '<leader>ff', fzf.files, opts)
map('n', '<leader>fg', fzf.grep_project, opts)
map('n', '<leader>fb', fzf.buffers, opts)
map('n', '<leader>fh', fzf.help_tags, opts)
map('n', '<leader>fm', fzf.marks, opts)
map('n', '<leader>gc', fzf.git_commits, opts)
map('n', '<leader>gs', fzf.git_status, opts)

-- Add :Rg command for compatibility with your workflow
vim.api.nvim_create_user_command('Rg', function(opts)
  local args = opts.args or ""
  if args == "" then
    fzf.grep_project()
  else
    fzf.grep_project({ search = args })
  end
end, { nargs = "?" })

-- Add :Fd command for fd-find integration
vim.api.nvim_create_user_command('Fd', function(opts)
  local args = opts.args or ""
  fzf.files({ fd_opts = "--color=never --type f " .. args })
end, { nargs = "?" })
