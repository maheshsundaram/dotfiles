-- lua/plugins/formatting.lua - Formatting Configuration with conform.nvim

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    -- JavaScript/TypeScript
    javascript = function(bufnr)
      if conform.get_formatter_info("deno_fmt", bufnr).available then
        return { "deno_fmt" }
      else
        return { "prettier" }
      end
    end,
    javascriptreact = function(bufnr)
      if conform.get_formatter_info("deno_fmt", bufnr).available then
        return { "deno_fmt" }
      else
        return { "prettier" }
      end
    end,
    typescript = function(bufnr)
      if conform.get_formatter_info("deno_fmt", bufnr).available then
        return { "deno_fmt" }
      else
        return { "prettier" }
      end
    end,
    typescriptreact = function(bufnr)
      if conform.get_formatter_info("deno_fmt", bufnr).available then
        return { "deno_fmt" }
      else
        return { "prettier" }
      end
    end,
    
    -- Web formats
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    json = function(bufnr)
      if conform.get_formatter_info("deno_fmt", bufnr).available then
        return { "deno_fmt" }
      else
        return { "prettier" }
      end
    end,
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    vue = { "prettier" },
    
    -- Python
    python = { "ruff_format" },
    
    -- Rust
    rust = { "rustfmt" },
  },
  
  -- Define formatter configurations
  formatters = {
    deno_fmt = {
      command = "deno",
      args = { "fmt", "-" },
      condition = function(self, ctx)
        return vim.fs.find({ "deno.json", "deno.jsonc" }, { path = ctx.filename, upward = true })[1] ~= nil
      end,
    },
    prettier = {
      condition = function(self, ctx)
        return vim.fs.find({ "deno.json", "deno.jsonc" }, { path = ctx.filename, upward = true })[1] == nil
      end,
    },
    ruff_format = {
      -- Ruff configuration if needed
    },
  },
  
  -- Format on save
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

-- Command to format current buffer with prettier (similar to your coc-prettier command)
vim.api.nvim_create_user_command("Prettier", function()
  conform.format({
    formatters = { "prettier" },
    async = true,
  })
end, {})
