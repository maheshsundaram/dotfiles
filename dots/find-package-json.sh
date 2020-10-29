#!/bin/bash

CMD='pkg'

find_package_json() {
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
      echo "No package.json in path"
    else
      # Look in parent directory if package.json is not found in current directory
      find_package_json "$(dirname $PKG_PATH)"
    fi
  else
    # Found
    echo "$PKG_PATH/package.json"
  fi
}

alias $CMD='find_package_json 2>&1'
