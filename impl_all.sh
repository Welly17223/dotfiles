#!/bin/bash

mkdir -p ~/.config

for i in ./*; do
  if [[ -d "$i" ]]; then
    # stow ${i}
    echo "stow ${i##*/}";
    stow ${i##*/} --dotfiles;
  fi
done
