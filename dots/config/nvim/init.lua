-- init.lua - Main Neovim configuration

-- Core settings
require('core.options')    -- Basic Neovim options
require('core.keymaps')    -- Key mappings
require('core.plugins')    -- Plugin management with lazy.nvim
require('core.colorscheme') -- Theme configuration
require('core.ui')         -- UI enhancements

-- Direct hover border override
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Create our own hover override with very distinct border
    local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
    }
    
    -- Override the hover window with our border
    local orig_hover_handler = vim.lsp.handlers["textDocument/hover"]
    vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
      config = config or {}
      config.border = border
      config.title = " Hover "
      config.title_pos = "center"
      return orig_hover_handler(err, result, ctx, config)
    end
  end,
})
