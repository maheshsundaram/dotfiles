-- lua/core/ui.lua - UI enhancements

-- Setup visual indicators for floating windows
local function enhance_ui()
  -- Set global floating window options with solid background and distinct border
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#f4b8e4", bg = "#1e2030", bold = true })
  vim.api.nvim_set_hl(0, "FloatTitle", { fg = "#f4b8e4", bg = "#1e2030", bold = true })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e2030" }) -- Darker solid background
  
  -- Set highlight groups for specific window types
  vim.api.nvim_set_hl(0, "LspFloatWinBorder", { link = "FloatBorder" })
  vim.api.nvim_set_hl(0, "LspFloatWinNormal", { link = "NormalFloat" })
  vim.api.nvim_set_hl(0, "DiagnosticFloatingHint", { fg = "#89b4fa" })
  
  -- Extremely visible double-line border characters 
  local border_chars = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
  
  -- Add this for padded content
  vim.o.fillchars = "eob: "  -- Remove ~ from empty lines
  
  -- Apply them to LSP handlers with padding
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = border_chars,
      title = " Hover ",
      title_pos = "center",
      max_width = 80,
      max_height = 30,
      focusable = false,
      padding = 1,     -- Add internal padding 
      style = "minimal",
      -- Force rounded corners through Markdown
      prefix = function(_, result)
        return "  " .. result, "markdown"
      end
    }
  )
  
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
      border = border_chars,
      title = " Signature ",
      title_pos = "center",
      max_width = 84,
      style = "minimal",
    }
  )
  
  -- Diagnostic floating window config
  vim.diagnostic.config({
    float = {
      border = border_chars,
      source = 'always',
      title = " Diagnostics ",
      title_pos = "center",
      focusable = false,
      style = "minimal",
      padding = 1,
    }
  })
end

-- Call the enhancement function
enhance_ui()

-- Create autocmd to ensure UI settings stick after colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    enhance_ui()
  end
})