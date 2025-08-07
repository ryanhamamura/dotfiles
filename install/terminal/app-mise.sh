#!/bin/bash

# Install mise for version management of different languages. 
# See https://mise.jdx.dev/

# Check if mise is already installed
if command -v mise &> /dev/null; then
    echo "Mise is already installed at $(which mise)"
    mise --version
    return 0 2>/dev/null || :
fi

echo "Installing Mise..."
sudo apt update -y && sudo apt install -y gpg wget curl 
sudo install -dm 755 /etc/apt/keyrings 
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1>/dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$(dpkg --print-architecture)] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
sudo apt update 
sudo apt install -y mise

