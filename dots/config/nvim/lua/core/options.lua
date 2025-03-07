-- lua/core/options.lua - Basic Neovim options

local opt = vim.opt
local g = vim.g

-- Leader Key
g.mapleader = " "

-- General Settings
opt.number = true                -- Line numbers
opt.termguicolors = true         -- True color support
opt.updatetime = 300             -- Faster completion
opt.cmdheight = 1                -- Command line height
opt.backspace = "2"              -- Backspace behavior
opt.expandtab = true             -- Use spaces instead of tabs
opt.shiftwidth = 2               -- Size of an indent
opt.softtabstop = 2              -- Number of spaces tabs count for
opt.splitright = true            -- Vertical splits to the right
opt.splitbelow = true            -- Horizontal splits below
opt.scrolloff = 999              -- Keep cursor centered
opt.ignorecase = true            -- Ignore case in search patterns

-- File backup, swap, and undo directories
opt.backupdir = vim.fn.stdpath('config') .. '/backup//'
opt.directory = vim.fn.stdpath('config') .. '/swap//'
opt.undodir = vim.fn.stdpath('config') .. '/undo//'

-- Create these directories if they don't exist
local function ensure_directory(dir)
  local path = vim.fn.expand(dir)
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p")
  end
end

ensure_directory(opt.backupdir:get()[1])
ensure_directory(opt.directory:get()[1])
ensure_directory(opt.undodir:get()[1])

-- Clipboard
if vim.fn.has("clipboard") == 1 then
  opt.clipboard = "unnamedplus"
end

-- Syntax and filetype
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- JSON with comments
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "tsconfig.json",
  command = "set filetype=jsonc"
})
