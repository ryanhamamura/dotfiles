#!/bin/bash 

# Dependencies
sudo apt update -y && sudo apt upgrade -y 
sudo apt install -y curl git stow zsh unzip fzf ripgrep jq

# Run terminal installers 
for installer in install/terminal/*.sh; do source $installer; done
