# Dotfiles

# Prerequisites

## Common

0. code

   ```bash
   mkdir -p ~/code
   ```

1. fzf
   ```bash
   mkdir -p ~/code/junegunn
   git clone --depth 1 https://github.com/junegunn/fzf.git ~/code/junegunn/
   ```

2. Vim
   ```bash
   mkdir -p ~/.vim/{backup,swap,undo}
   ```

3. Rust
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   source "$HOME/.cargo/env"
   ```

4. fd
   ```bash
   cargo install fd-find
   ```

5. Deno
   ```bash
   curl -fsSL https://deno.land/x/install/install.sh | sh
   ```

6. Bun
   ```bash
   curl -fsSL https://bun.sh/install | bash
   ```

7. fnm
   ```bash
   curl -fsSL https://fnm.vercel.app/install | bash
   ```

8. ripgrep
   ```bash
   cargo install ripgrep
   ```

9. Neovim - [Download latest release](https://github.com/neovim/neovim/releases)

### macOS

1. [Karabiner Elements](https://karabiner-elements.pqrs.org/) for keyboard customization

2. Homebrew:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

3. Other utils:
   ```bash
   brew install bash-completion tmux git-extras
   ```

### Ubuntu

1. Required packages:
   ```bash
   sudo apt update
   sudo apt install -y bash-completion tmux git curl wget build-essential
   ```

## Install

```bash
./install.sh
touch ~/.secrets.sh
chmod 600 ~/.secrets.sh # for any private sourced environment variables
source ~/.bashrc
```
