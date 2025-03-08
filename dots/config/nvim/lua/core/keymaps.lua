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

-- Diagnostic keymaps
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic in floating window' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- LSP
map('n', '<leader>r', '<cmd>lua require("fzf-lua").lsp_references()<CR>', opts)
map('n', '<leader>d', vim.lsp.buf.definition, opts)
map('n', '<leader>k', vim.lsp.buf.hover, opts)
map('n', '<leader>n', vim.lsp.buf.rename, opts)
map('n', '<leader>o', '<cmd>lua require("fzf-lua").lsp_document_symbols()<CR>', opts)

-- Reserve other mappings for plugin-specific configuration
-- These will be defined in the respective plugin configurations
