# FZF-Lua Commands Reference

## Command-Line Commands

Commands that can be used directly in Neovim command mode:

| Command | Description |
|---------|-------------|
| `:Rg [pattern]` | Search for pattern in project files using ripgrep |
| `:Fd [options]` | Find files using fd-find with optional arguments |

## Key Mappings

### Core Mappings (From Your Original Config)

| Key | Mode | Action |
|-----|------|--------|
| `<C-f>` | Normal | Find files in current directory |
| `<C-b>` | Normal | Browse open buffers |
| `<C-g>` | Normal | Find files in GitHub directory |

### Additional Mappings

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files (same as `<C-f>`) |
| `<leader>fg` | Normal | Grep/search in project (same as `:Rg`) |
| `<leader>fb` | Normal | List buffers (same as `<C-b>`) |
| `<leader>fh` | Normal | Search help tags |
| `<leader>fm` | Normal | Browse marks |
| `<leader>gc` | Normal | Browse git commits |
| `<leader>gs` | Normal | Show git status |

## FZF-Lua Interface Keys

These keys work within the FZF popup window:

| Key | Action |
|-----|--------|
| `Ctrl-c` | Cancel/close FZF window |
| `Ctrl-j` | Move selection down |
| `Ctrl-k` | Move selection up |
| `Ctrl-q` | Select all matches and accept |
| `Ctrl-a` | Toggle selection |
| `Ctrl-s` | Open in horizontal split |
| `Ctrl-v` | Open in vertical split |
| `Ctrl-t` | Open in new tab |
| `Ctrl-u` | Scroll preview up |
| `Ctrl-d` | Scroll preview down |

## Tips for ripgrep Integration

1. **Ignore Patterns**: The ripgrep command is configured to ignore `.git` and `node_modules` directories by default.

2. **Search Options**: When using `:Rg` you can:
   - Search for exact matches with quotes: `:Rg "exact phrase"`
   - Use regex patterns: `:Rg function\s+\w+\(`
   - Case sensitive search: `:Rg -s pattern`
   - Match whole words only: `:Rg -w word`

3. **Quickfix List**: Press `Ctrl-q` in the results to send all matches to the quickfix list

## Tips for fd Integration

1. **Custom Search**: Use `:Fd` with arguments to customize the search:
   - Search specific file types: `:Fd -e js`
   - Search in specific directory: `:Fd . ~/projects`
   - Exclude patterns: `:Fd -E "*.temp"`

2. **Hidden Files**: fd is configured to show hidden files by default (`--hidden`)

3. **Combine with fzf**: The output of fd is piped to fzf for fuzzy filtering
