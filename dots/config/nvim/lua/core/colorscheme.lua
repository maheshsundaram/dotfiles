-- lua/core/colorscheme.lua - Theme configuration

-- Set the colorscheme
vim.cmd('colorscheme catppuccin-macchiato')

-- Set background (light or dark)
vim.opt.background = 'dark'

-- Custom highlight groups
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Enhance floating window borders
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#89b4fa", bold = true })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#303446" })

    -- Set up floating window title highlights
    vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#cba6f7", bold = true })
  end,
})

-- Trigger the autocmd to apply the highlights
vim.cmd("doautocmd ColorScheme")
