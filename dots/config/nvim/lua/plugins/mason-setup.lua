-- lua/plugins/mason-setup.lua - Mason and Mason-lspconfig Setup

-- Set up Mason first
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Set up mason-lspconfig
require("mason-lspconfig").setup({
  -- Automatically install these LSP servers
  ensure_installed = {
    "ts_ls",      -- TypeScript/JavaScript (correct server name for mason-lspconfig)
    "eslint",     -- ESLint
    "cssls",      -- CSS
    "rust_analyzer", -- Rust
    "pyright",    -- Python
    "denols",     -- Deno Language Server
  },
  -- Auto-install configured servers (with lspconfig)
  automatic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- The actual LSP setup is handled in the lsp.lua file
-- This is just to ensure the servers are installed

-- Print instructions for diagnosing LSP issues
-- print("To check LSP status, run:")
-- print("  :LspInfo - Shows active LSP clients for current buffer")
-- print("  :Mason - Opens Mason package manager")
-- print("  :checkhealth - Run Neovim health checks")
