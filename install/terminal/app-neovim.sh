#!/bin/bash 

sudo apt-get install ninja-build gettext cmake curl build-essential 

mkdir -p ~/src && cd ~/src
git clone https://github.com/neovim/neovim && cd neovim 
git checkout stable 
make CMAKE_BUILD_TYPE=Release
sudo make install 

cd -
cd -
