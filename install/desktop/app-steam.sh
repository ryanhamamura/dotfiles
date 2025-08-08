#!/bin/bash

# Check if Steam is already installed
if command -v steam &> /dev/null || [ -f /usr/games/steam ]; then
    echo "Steam is already installed"
    steam --version 2>/dev/null || echo "Steam launcher detected"
    return 0 2>/dev/null || :
fi

echo "Installing Steam..."

# Enable 32-bit architecture support (required for Steam)
sudo dpkg --add-architecture i386
sudo apt update

# Install Steam
sudo apt install -y steam

echo "Steam installed successfully"