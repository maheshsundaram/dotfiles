# Neovim Lua Configuration

This is a modern Lua-based configuration for Neovim, migrated from a traditional Vimscript setup. The configuration uses lazy.nvim for plugin management, native LSP for code intelligence, and a variety of modern plugins to enhance the experience.

## Installation

1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Create the necessary directory structure:
   ```bash
   mkdir -p ~/.config/nvim/lua/core
   mkdir -p ~/.config/nvim/lua/plugins
   ```

3. Copy all the configuration files to their respective directories.

4. Start Neovim:
   ```bash
   nvim
   ```

The first time you start Neovim with this configuration, it will automatically:
- Install lazy.nvim (plugin manager)
- Install all the specified plugins
- Set up the LSP servers

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Main configuration file
├── lua/
│   ├── core/
│   │   ├── options.lua       # Basic Neovim options
│   │   ├── keymaps.lua       # Key mappings
│   │   ├── plugins.lua       # Plugin management with lazy.nvim
│   │   └── colorscheme.lua   # Theme configuration
│   └── plugins/
│       ├── lsp.lua           # LSP configuration
│       ├── completion.lua    # Completion configuration
│       ├── statusline.lua    # Status line configuration
│       ├── filebrowser.lua   # File browser configuration
│       ├── telescope.lua     # Telescope configuration
│       ├── treesitter.lua    # Treesitter configuration
│       └── formatting.lua    # Formatting configuration
```

## Features

This configuration includes modern replacements for all the plugins in your original setup:

| Original Plugin | Modern Replacement |
|-----------------|-------------------|
| vim-plug | lazy.nvim |
| coc.nvim | Native LSP + nvim-cmp |
| delimitMate | nvim-autopairs |
| vim-airline | lualine.nvim |
| vim-vinegar | neo-tree.nvim |
| vim-json | Treesitter |
| fzf.vim | fzf-lua |
| vim-easy-align | (kept the same) |
| Language-specific plugins | nvim-treesitter |

## Key Mappings

Most of your key mappings have been preserved:

- `Space` is the leader key
- `<C-h/j/k/l>` for window navigation
- `<C-n/p>` for buffer navigation
- `<C-f>` for file search
- `<C-b>` for buffer search
- `<C-g>` for GitHub files
- `K` for hovering documentation
- `gd` for go to definition
- `<leader>rn` for renaming

New mappings:
- `-` to toggle the file explorer
- `<leader>ff` for finding files
- `<leader>fg` for live grep
- `<leader>fb` for listing buffers
- `<leader>fh` for help tags

## LSP Servers

The configuration sets up the following LSP servers (replacing coc extensions):

- tsserver (JavaScript/TypeScript)
- eslint
- cssls
- rust_analyzer
- pyright

## Additional Plugins and Features

1. **nvim-treesitter**: Advanced syntax highlighting and code understanding
2. **nvim-cmp**: Smart code completion
3. **null-ls**: Formatting and linting
4. **lualine.nvim**: Beautiful status line
5. **neo-tree.nvim**: Modern file explorer
6. **fzf-lua**: Fuzzy finder that integrates with fzf
7. **rose-pine**: Modern theme (preserved from your original config)

## Customization

If you need to add more plugins or customize the configuration:

1. Add new plugins in `lua/core/plugins.lua`
2. Create new configuration files in the `lua/plugins/` directory
3. Modify existing configurations as needed

## Prerequisites

- Neovim 0.8.0 or higher
- git (for installing plugins)
- A Nerd Font (for icons)
- Language servers (they will be automatically installed by Mason)

## Troubleshooting

If you encounter any issues:

1. Check the health of your Neovim installation with `:checkhealth`
2. Ensure all dependencies are properly installed
3. Update plugins with `:Lazy update`

## Migration Notes

This configuration preserves most of your workflow while upgrading to modern Neovim features:

1. Native LSP instead of CoC for better performance and integration
2. Treesitter for improved syntax highlighting
3. Structured Lua configuration for better organization
4. Lazy loading plugins for faster startup

Enjoy your new modern Neovim setup!
