-- lua/plugins/formatting.lua - Formatting Configuration

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Formatting
    null_ls.builtins.formatting.deno_fmt.with({
      condition = function(utils)
        -- Only use deno_fmt in Deno projects
        return utils.root_has_file({ "deno.json", "deno.jsonc" })
      end,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
    }),
    null_ls.builtins.formatting.prettier.with({
      -- Don't use prettier in Deno projects
      condition = function(utils)
        return not utils.root_has_file({ "deno.json", "deno.jsonc" })
      end,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "jsonc",
        "yaml",
        "markdown",
        "graphql",
      },
    }),
    null_ls.builtins.formatting.black.with({ -- Python formatter
      extra_args = { "--fast" },
    }),
    null_ls.builtins.formatting.rustfmt, -- Rust formatter
    
    -- Diagnostics
    null_ls.builtins.diagnostics.eslint.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
      },
    }),
    null_ls.builtins.diagnostics.flake8, -- Python linter
    
    -- Code actions
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.gitsigns,
  },
  
  -- Format on save (uncomment if you want this behavior)
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --       end,
  --     })
  --   end
  -- end,
})

-- Command to format current buffer with prettier (similar to your coc-prettier command)
vim.api.nvim_create_user_command("Prettier", function()
  vim.lsp.buf.format({ 
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end
  })
end, {})
