# !/bin/bash

curl -OL https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xzf stow-latest.tar.gz
cd stow-*
./configure && sudo make install
cd ..
rm -rf stow-latest stow-latest.tar.gz
