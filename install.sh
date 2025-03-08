#!/bin/bash

cd ./dots

HOME_DOTS=$(pwd)

# Find all files in the HOME_DOTS directory and its subdirectories
# -type f: Only find files (not directories)
# -follow: Follow symbolic links
# -print: Print the full path of each file
echo "Finding all dotfiles in the repository..."
SOURCE_FILES=($(find $HOME_DOTS -type f -follow -print))
echo "Found ${#SOURCE_FILES[@]} files to process"

for CURRENT_PATH in ${SOURCE_FILES[*]}
do
  # Get the directory and filename of the current file
  DIRECTORY=$(dirname $CURRENT_PATH)
  FILENAME=$(basename $CURRENT_PATH)
  
  # Check if the file is directly in the dots directory (not in a subdirectory)
  if [ "$DIRECTORY" = "$HOME_DOTS" ]; then
    echo "  Linking to $HOME/.$FILENAME"
    ln -fs $CURRENT_PATH $HOME/.$FILENAME
  else
    # For files in subdirectories, preserve the directory structure in HOME
    
    # Get the length of the HOME_DOTS path
    HOME_DOTS_LENGTH=${#HOME_DOTS}
    
    # Extract the subdirectory path relative to HOME_DOTS
    # +1 to skip the / character after HOME_DOTS
    SUBDIRECTORY=${DIRECTORY:$HOME_DOTS_LENGTH + 1}
    
    # Create the target directory path in HOME with a dot prefix
    TARGET_DIR="$HOME/.$SUBDIRECTORY"
    
    # Create the target directory if it doesn't exist
    mkdir -p $TARGET_DIR
    
    # Create the full target path for the symbolic link
    TARGET_PATH="$TARGET_DIR/$FILENAME"
    
    echo "  Linking to: $TARGET_PATH"
    ln -fs $CURRENT_PATH $TARGET_PATH
  fi
done
