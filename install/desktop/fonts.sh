#!/bin/bash

# Check if CascadiaMono Nerd Font is already installed
if fc-list | grep -q "CaskaydiaMono Nerd Font"; then
	echo "CascadiaMono Nerd Font is already installed"
	fc-list | grep "CaskaydiaMono" | head -3
	return 0 2>/dev/null || :
fi

echo "Installing CascadiaMono Nerd Font..."
mkdir -p ~/.local/share/fonts

cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaMono.zip
unzip -o CascadiaMono.zip -d CascadiaFont
cp CascadiaFont/*.ttf ~/.local/share/fonts
rm -rf CascadiaMono.zip CascadiaFont

fc-cache -f -v
echo "Font cache updated"
cd -
