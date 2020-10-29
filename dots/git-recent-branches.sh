#!/bin/bash

# The command to invoke the script.
CMD='b'

# The number of recent branches to show and select from.
N=10

_b() {
  # The current branch to filter out.
  CURRENT="$(git rev-parse --abbrev-ref HEAD)"

  # Get the list of recent branches.
  # N+1 because the current branch will be filtered out.
  BRANCHES=($(
    git branch --sort=-committerdate |
      head -n $(($N+1)) |
      sed 's/\*//' |
      sed 's/[ \t]*//' |
      grep -v $CURRENT
  ))

  # Show the list of branches.
  for i in "${!BRANCHES[@]}"
  do
    echo "$i) ${BRANCHES[$i]}"
  done

  # Let the user choose the branch by index.
  INDEX=0
  read -p "> " INDEX

  # Switch to the branch.
  SELECTION=${BRANCHES[$INDEX]}
  git checkout $SELECTION
}

# Alias the command.
alias $CMD='_b 2>&1'
