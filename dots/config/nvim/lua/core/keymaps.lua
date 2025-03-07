-- lua/core/keymaps.lua - Key mappings

local map = vim.keymap.set

-- Disable Space key
map('n', '<Space>', '<nop>')

-- Window navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move to left window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move to bottom window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move to top window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move to right window' })

-- Buffer navigation
map('n', '<C-n>', ':bnext<CR>', { desc = 'Next buffer' })
map('n', '<C-p>', ':bprev<CR>', { desc = 'Previous buffer' })

-- Insert mode mappings
map('i', '<C-c>', '<CR><Esc>O', { desc = 'Insert newline and position cursor' })

-- Reserve other mappings for plugin-specific configuration
-- These will be defined in the respective plugin configurations
