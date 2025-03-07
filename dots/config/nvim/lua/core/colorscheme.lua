-- lua/core/colorscheme.lua - Theme configuration

-- Set the colorscheme
vim.cmd('colorscheme rose-pine-moon')

-- Set background (light or dark)
vim.opt.background = 'dark'

-- Custom highlight groups
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Set custom highlights for floating windows (like hover popups)
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#907aa9" })
  end,
})

-- Trigger the autocmd to apply the highlights
vim.cmd("doautocmd ColorScheme")
