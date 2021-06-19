gli() {
  local filter
  if [ -n $@ ] && [ -f $@ ]; then
    filter="-- $@"
  fi

  git log \
    --graph --color=always --abbrev=7 --format='%C(auto)%h %an %C(blue)%s %C(yellow)%cr' $@ | \
    fzf \
      --ansi --no-sort --reverse --tiebreak=index \
      --preview "f() { set -- \$(echo -- \$@ | grep -o '[a-f0-9]\{7\}'); [ \$# -eq 0 ] || git show --color=always \$1 $filter; }; f {}" \
      --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
                FZF-EOF" \
      --preview-window=right:60% \
      --height 100%
}

b() {
  git branch --sort=-committerdate | fzf | xargs git checkout
}

ns() {
  # | column -s "!" -t | fzf | cut -d " " -f 1
  jq -r '.scripts | keys[]' < package.json |\
    fzf \
    --preview "f() { set -- \$(echo -- \$@); grep -- \$1 package.json }; f {}" \
      --preview-window=right:60% \
      --height 100%
}
