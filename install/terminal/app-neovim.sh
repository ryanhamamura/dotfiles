#!/bin/bash 

# Check if neovim is already installed
if command -v nvim &> /dev/null; then
    echo "Neovim is already installed at $(which nvim)"
    nvim --version | head -1
    return 0 2>/dev/null || :
fi

echo "Installing Neovim from source..."

# Install build dependencies
sudo apt-get install -y ninja-build gettext cmake curl build-essential 

# Clone and build neovim
mkdir -p ~/src && cd ~/src

if [ -d "neovim" ]; then
    echo "Neovim source already exists, updating..."
    cd neovim
    git fetch
    git checkout stable
    git pull
else
    git clone https://github.com/neovim/neovim && cd neovim 
    git checkout stable 
fi

make CMAKE_BUILD_TYPE=Release
sudo make install 

cd -
cd -
