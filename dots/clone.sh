#!/bin/bash

CMD='clone'

_clone() {
  ORIGIN=$(pwd)

  if [ -z $1 ]; then
    echo "Usage: clone <organization or user>/<repo>"
    echo "E.g.: clone maheshsundaram/dotfiles"
  else
    ORG=$(dirname $1)
    REPO=$(basename $1)
    FOLDER="$HOME/src/github.com/$ORG"

    mkdir -p $FOLDER
    cd $FOLDER
    git clone git@github.com:$1
    cd $ORIGIN
  fi
}

alias $CMD='_clone 2>&1'
