-- lua/plugins/lsp.lua - LSP Configuration

local lspconfig = require('lspconfig')
local map = vim.keymap.set

-- LSP keybindings
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer local mappings
  local opts = { noremap = true, silent = true, buffer = bufnr }
  
  -- Definition, references, etc.
  map('n', 'gd', vim.lsp.buf.definition, opts)
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', '<leader>rn', vim.lsp.buf.rename, opts)
  
  -- Diagnostics
  map('n', '<C-e>', function() 
    require('fzf-lua').diagnostics_document()
  end, opts)
  
  -- Document outline
  map('n', '<C-o>', function() 
    require('fzf-lua').lsp_document_symbols()
  end, opts)
end

-- LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Setup LSP servers (equivalent to coc extensions)
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Format on save
vim.api.nvim_create_user_command("Format", function()
  vim.lsp.buf.format({ async = true })
end, {})

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- Add prettier command (equivalent to coc-prettier)
vim.api.nvim_create_user_command("Prettier", function()
  vim.cmd('Format')
end, {})

-- Custom diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
