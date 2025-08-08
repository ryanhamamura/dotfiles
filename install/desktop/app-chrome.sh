#!/bin/bash 

# Check if Google Chrome is already installed
if command -v google-chrome &> /dev/null || command -v google-chrome-stable &> /dev/null; then
    echo "Google Chrome is already installed"
    google-chrome --version 2>/dev/null || google-chrome-stable --version 2>/dev/null
    
    # Still set as default browser
    xdg-settings set default-web-browser google-chrome.desktop
    return 0 2>/dev/null || :
fi

echo "Installing Google Chrome..."
cd /tmp 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo apt install -y ./google-chrome-stable_current_amd64.deb 
rm google-chrome-stable_current_amd64.deb 
xdg-settings set default-web-browser google-chrome.desktop 
cd -
