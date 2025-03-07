-- lua/core/colorscheme.lua - Theme configuration

-- Set the colorscheme
vim.cmd('colorscheme catppuccin-macchiato')

-- Set background (light or dark)
vim.opt.background = 'dark'

-- Custom highlight groups
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Set custom highlights for floating windows (like hover popups)
    -- These colors are adjusted for Catppuccin Mocha
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#89b4fa" })
    
    -- LSP related highlighting
    vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { fg = "#f38ba8", bold = true })
    vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#313244" })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#313244" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#313244" })
    
    -- Diagnostic highlights
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#f38ba8", bg = "#332231" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fab387", bg = "#332e1f" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#89b4fa", bg = "#1e2a3f" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#cba6f7", bg = "#2a2337" })
  end,
})

-- Trigger the autocmd to apply the highlights
vim.cmd("doautocmd ColorScheme")
