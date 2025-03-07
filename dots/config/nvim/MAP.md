# Neovim Configuration Map

This document provides a comprehensive overview of your Neovim configuration, including file structure, key mappings, plugins, and customization options.

## Configuration Structure

```
~/.config/nvim/
├── init.lua                   # Main configuration entry point
├── lua/
│   ├── core/                  # Core configuration
│   │   ├── options.lua        # Basic Neovim options
│   │   ├── keymaps.lua        # Key mappings
│   │   ├── plugins.lua        # Plugin management with lazy.nvim
│   │   └── colorscheme.lua    # Theme configuration (Catppuccin)
│   └── plugins/               # Plugin-specific configurations
│       ├── lsp.lua            # LSP configuration
│       ├── completion.lua     # Completion configuration
│       ├── statusline.lua     # Status line configuration (lualine)
│       ├── filebrowser.lua    # File browser configuration (neo-tree)
│       ├── fzf-lua.lua        # FZF-Lua configuration for fuzzy finding
│       ├── treesitter.lua     # Treesitter configuration
│       ├── formatting.lua     # Formatting configuration (null-ls)
│       └── mason-setup.lua    # Mason LSP/formatter installer setup
```

## Key Mappings

### General Mappings

| Key           | Mode   | Action                             | Defined in            |
|---------------|--------|------------------------------------|-----------------------|
| `<Space>`     | Normal | Leader key                         | `core/keymaps.lua`    |
| `<C-h>`       | Normal | Move to left window                | `core/keymaps.lua`    |
| `<C-j>`       | Normal | Move to bottom window              | `core/keymaps.lua`    |
| `<C-k>`       | Normal | Move to top window                 | `core/keymaps.lua`    |
| `<C-l>`       | Normal | Move to right window               | `core/keymaps.lua`    |
| `<C-n>`       | Normal | Next buffer                        | `core/keymaps.lua`    |
| `<C-p>`       | Normal | Previous buffer                    | `core/keymaps.lua`    |
| `<C-c>`       | Insert | Insert newline and position cursor | `core/keymaps.lua`    |
| `<leader>e`   | Normal | Show diagnostic in floating window | `core/keymaps.lua`    |
| `<leader>q`   | Normal | Open diagnostics list              | `core/keymaps.lua`    |
| `[d`          | Normal | Go to previous diagnostic          | `core/keymaps.lua`    |
| `]d`          | Normal | Go to next diagnostic              | `core/keymaps.lua`    |

### LSP Mappings

| Key           | Mode   | Action                           | Defined in            |
|---------------|--------|---------------------------------|-----------------------|
| `K`           | Normal | Show hover documentation        | `plugins/lsp.lua`     |
| `gd`          | Normal | Go to definition                | `plugins/lsp.lua`     |
| `<leader>rn`  | Normal | Rename symbol                   | `plugins/lsp.lua`     |
| `<C-e>`       | Normal | Show diagnostics               | `plugins/lsp.lua`     |
| `<C-o>`       | Normal | Show document symbols           | `plugins/lsp.lua`     |

### Fuzzy Finding (FZF-Lua)

| Key           | Mode   | Action                          | Defined in            |
|---------------|--------|--------------------------------|-----------------------|
| `<C-f>`       | Normal | Find files                      | `plugins/fzf-lua.lua` |
| `<C-b>`       | Normal | List buffers                    | `plugins/fzf-lua.lua` |
| `<C-g>`       | Normal | Find files in GitHub directory  | `plugins/fzf-lua.lua` |
| `<leader>ff`  | Normal | Find files                      | `plugins/fzf-lua.lua` |
| `<leader>fg`  | Normal | Grep in project                 | `plugins/fzf-lua.lua` |
| `<leader>fb`  | Normal | List buffers                    | `plugins/fzf-lua.lua` |
| `<leader>fh`  | Normal | Help tags                       | `plugins/fzf-lua.lua` |
| `<leader>fm`  | Normal | Marks                           | `plugins/fzf-lua.lua` |
| `<leader>gc`  | Normal | Git commits                     | `plugins/fzf-lua.lua` |
| `<leader>gs`  | Normal | Git status                      | `plugins/fzf-lua.lua` |

### File Browser (Neo-tree)

| Key           | Mode   | Action                          | Defined in            |
|---------------|--------|--------------------------------|-----------------------|
| `-`           | Normal | Toggle file explorer            | `plugins/filebrowser.lua` |
| `<space>`     | Normal | Toggle node expansion           | Inside Neo-tree window |
| `<cr>`        | Normal | Open file                       | Inside Neo-tree window |
| `s`           | Normal | Open in vertical split          | Inside Neo-tree window |
| `S`           | Normal | Open in horizontal split        | Inside Neo-tree window |
| `t`           | Normal | Open in new tab                 | Inside Neo-tree window |
| `a`           | Normal | Add file/directory              | Inside Neo-tree window |
| `d`           | Normal | Delete                          | Inside Neo-tree window |
| `r`           | Normal | Rename                          | Inside Neo-tree window |
| `q`           | Normal | Close window                    | Inside Neo-tree window |

### Text Editing

| Key           | Mode   | Action                          | Defined in            |
|---------------|--------|--------------------------------|-----------------------|
| `ga`          | Visual | EasyAlign                       | `plugins.lua` (preserved from original config) |

## Plugins

| Plugin               | Purpose                          | Configuration File    |
|----------------------|----------------------------------|-----------------------|
| `lazy.nvim`          | Plugin management                | `core/plugins.lua`   |
| `nvim-lspconfig`     | LSP configuration                | `plugins/lsp.lua`    |
| `mason.nvim`         | LSP/formatter installer          | `plugins/mason-setup.lua` |
| `nvim-cmp`           | Code completion                  | `plugins/completion.lua` |
| `nvim-autopairs`     | Auto-pair brackets, quotes, etc. | `plugins.lua`        |
| `lualine.nvim`       | Status line                      | `plugins/statusline.lua` |
| `neo-tree.nvim`      | File explorer                    | `plugins/filebrowser.lua` |
| `fzf-lua`            | Fuzzy finding                    | `plugins/fzf-lua.lua` |
| `nvim-treesitter`    | Syntax highlighting              | `plugins/treesitter.lua` |
| `null-ls.nvim`       | Formatting and linting           | `plugins/formatting.lua` |
| `vim-easy-align`     | Text alignment                   | `plugins.lua`        |
| `catppuccin`         | Color scheme                     | `core/colorscheme.lua` |

## LSP Servers

The following LSP servers are configured in `plugins/lsp.lua` and can be installed via Mason:

| Server            | Language/Format              | Installation Command |
|-------------------|------------------------------|---------------------|
| `ts_ls`           | TypeScript/JavaScript        | `:MasonInstall typescript-language-server` |
| `eslint`          | ESLint                       | `:MasonInstall eslint-lsp` |
| `cssls`           | CSS                          | `:MasonInstall css-lsp` |
| `rust_analyzer`   | Rust                         | `:MasonInstall rust-analyzer` |
| `pyright`         | Python                       | `:MasonInstall pyright` |

## Theme Customization

Your configuration uses the Catppuccin theme with the following customization options:

- **Current flavor**: "mocha" (dark theme with vibrant colors)
- **Available flavors**: "latte" (light), "frappe" (medium dark), "macchiato" (darker), "mocha" (darkest)
- **Location**: `core/plugins.lua` and `core/colorscheme.lua`

To change the theme flavor:

1. Edit `core/plugins.lua` to change the `flavour` option
2. Edit `core/colorscheme.lua` to update the colorscheme command

## Common Tasks

### Add a New Plugin

1. Edit `core/plugins.lua`
2. Add a new entry in the `require("lazy").setup({...})` table
3. Create a configuration file in `plugins/` if needed
4. Restart Neovim or run `:Lazy sync`

### Change Key Mappings

1. For general mappings, edit `core/keymaps.lua`
2. For plugin-specific mappings, edit the respective plugin configuration file
3. The format for adding keys is: `vim.keymap.set('mode', 'key', command, options)`

### Install/Update LSP Servers

1. Open Neovim and run `:Mason`
2. Browse available servers and press `i` to install
3. Or install directly with `:MasonInstall server-name`
4. Configuration for servers is in `plugins/lsp.lua`

### Format Code on Save

To enable format-on-save functionality:

1. Edit `plugins/formatting.lua`
2. Uncomment the `on_attach` function that sets up the `BufWritePre` autocommand

### Check Diagnostic and LSP Status

Use these commands:
- `:LspInfo` - Check active language servers
- `:lua vim.diagnostic.open_float()` or `<leader>e` - View diagnostics at cursor
- `:checkhealth` - Run Neovim health checks

## Custom Commands

| Command       | Action                           | Defined in            |
|---------------|----------------------------------|-----------------------|
| `:Format`     | Format current buffer            | `plugins/lsp.lua`     |
| `:Prettier`   | Format using Prettier            | `plugins/lsp.lua`     |
| `:Rg [pattern]` | Search with ripgrep             | `plugins/fzf-lua.lua` |
| `:Fd [options]` | Find files with fd-find         | `plugins/fzf-lua.lua` |

## Troubleshooting

### LSP Issues

1. Check server installation: `:Mason` 
2. Verify LSP status: `:LspInfo`
3. Check health: `:checkhealth`
4. See logs: `:lua vim.cmd('e' .. vim.lsp.get_log_path())`

### Plugin Problems

1. Check plugin status: `:Lazy`
2. Update plugins: `:Lazy update`
3. Clean unused plugins: `:Lazy clean`

### UI Issues

Theme and UI issues can usually be fixed by:
1. Redefining highlight groups in `core/colorscheme.lua`
2. Updating the theme settings in `core/plugins.lua`
