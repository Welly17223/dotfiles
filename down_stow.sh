#!/bin/bash

CURDIR=$(pwd)
mkdir -p ./_temp
cd ./_temp || (echo "Failed to change directory to _temp" && exit 1)
curl -OL https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xzf stow-latest.tar.gz
rm stow-latest.tar.gz
cd stow-* || (echo "Failed to change directory to _temp" && exit 1)
./configure && sudo make install
cd .. || (echo "Failed to change directory to _temp" && exit 1)
cd "$CURDIR" || (echo "Failed to change directory to _temp" && exit 1)
rm -rf ./_temp
