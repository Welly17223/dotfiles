# !/bin/bash

CURDIR=$(pwd)
mkdir -p ./_temp
cd ./_temp
curl -OL https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xzf stow-latest.tar.gz
rm stow-latest.tar.gz
cd stow-*
./configure && sudo make install
cd ..
cd $CURDIR
rm -rf ./_temp
