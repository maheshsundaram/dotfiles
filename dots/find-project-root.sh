#!/bin/bash

CMD='rt'

find_project_root() {
  # Initialize with the current directory
  if [ -z $1 ]; then
    PKG_PATH=$(pwd)
  # Otherwise use the recursive argument
  else
    PKG_PATH=$1
  fi

  if [ ! -f "$PKG_PATH/package.json" ]; then
    # Exit if root has been reached and package.json still not found
    if [ "$PKG_PATH" == "/" ]; then
      echo "No project in path"
    else
      # Look in parent directory if package.json is not found in current directory
      find_project_root "$(dirname $PKG_PATH)"
    fi
  else
    # Found
    cd "$PKG_PATH"
  fi
}

alias $CMD='find_project_root 2>&1'
