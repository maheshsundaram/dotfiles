# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/code/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/code/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/code/junegunn/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/code/junegunn/fzf/shell/key-bindings.bash"

# Options
export FZF_DEFAULT_OPTS='--height 90% --border --color=light'

export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# TAB starts completion
export FZF_COMPLETION_TRIGGER='.'

# cargo install fd-find
# Use fd instead of the default find
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude node_modules/ . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude node_modules/ . "$1"
}
