#!/bin/bash

_pass() {
  ORIGIN=$(pwd)
  cd $HOME/.password-store
  local pass=$(fd . | sed 's/.gpg//g' | fzf)
  echo $pass
  pass $1 $pass
  cd $ORIGIN
}

_lastpass() {
  lpass ls | grep id | sed 's:[^/]*/\(.*\):\1:' | fzf | sed 's/[^0-9]*//g' | xargs -I {} lpass show {}
}

if [ "$(uname)" = "Linux" ]; then
  alias p='_pass 2>&1'
  alias pc='_pass -c'
elif [ "$(uname)" = "Darwin" ]; then
  alias p='_lastpass 2>&1'
fi
