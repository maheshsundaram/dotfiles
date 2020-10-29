#!/bin/bash
cd ./dots

H=$(pwd)
S=($(find $H -type f -follow -print))

for P in ${S[*]}
do
  D=$(dirname $P)
  F=$(basename $P)

  if [ "$D" = "$H" ]; then
    echo "ln -fs $P $HOME/.$F"
    ln -fs $P $HOME/.$F
  else
    L=${#H}
    Z=${D:$L+ 1}
    M="$HOME/.$Z"

    mkdir -p $M

    K="$M/$F"
    echo "ln -fs $P $K"
    ln -fs $P $K
  fi

done
