#!/bin/bash

# Check if oh-my-posh is already installed
if command -v oh-my-posh &> /dev/null; then
    echo "Oh My Posh is already installed at $(which oh-my-posh)"
    oh-my-posh --version
    return 0 2>/dev/null || :
fi

echo "Installing Oh My Posh..."
sudo apt install -y unzip 
curl -s https://ohmyposh.dev/install.sh | bash -s
