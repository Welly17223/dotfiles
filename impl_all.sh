#!/bin/bash

mkdir -p ~/.config

for i in ./*; do
  if [[ ! "$i" = "./impl_all.sh" ]]; then
    # stow ${i}
    echo "stow ${i##*/}";
    stow ${i##*/};
  fi
done
