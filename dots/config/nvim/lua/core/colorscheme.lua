-- lua/core/colorscheme.lua - Theme configuration

-- Set the colorscheme
vim.cmd('colorscheme catppuccin-macchiato')

-- Set background (light or dark)
vim.opt.background = 'dark'

-- Custom highlight groups
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- No modifications currently
  end,
})

-- Trigger the autocmd to apply the highlights
vim.cmd("doautocmd ColorScheme")
