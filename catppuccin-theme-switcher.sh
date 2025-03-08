#!/bin/bash
# Save as ~/bin/theme-switch or somewhere in your PATH

# Check if flavor argument is provided
if [ -z "$1" ]; then
  echo "Usage: theme-switch [latte|frappe|macchiato|mocha]"
  exit 1
fi

FLAVOR="$1"

# Validate flavor
if [[ ! "$FLAVOR" =~ ^(latte|frappe|macchiato|mocha)$ ]]; then
  echo "Invalid flavor. Choose from: latte, frappe, macchiato, mocha"
  exit 1
fi

# For macOS, the -i flag requires an extension argument (even if empty)
# Update Neovim plugins.lua
sed -i '' "s/flavour = \"[a-z]*\"/flavour = \"$FLAVOR\"/" "./dots/config/nvim/lua/core/plugins.lua"

# Update Neovim colorscheme.lua
sed -i '' "s/colorscheme catppuccin-[a-z]*/colorscheme catppuccin-$FLAVOR/" "./dots/config/nvim/lua/core/colorscheme.lua"

# Update Ghostty config
sed -i '' "s/theme = catppuccin-[a-z]*.conf/theme = catppuccin-$FLAVOR.conf/" "./dots/config/ghostty/config"

# Update Tmux config
sed -i '' "s/@catppuccin_flavor '[a-z]*'/@catppuccin_flavor '$FLAVOR'/" "./dots/tmux.conf"

echo "Theme switched to $FLAVOR"
echo "Restart your applications (Neovim, Ghostty, Tmux) to apply changes"
