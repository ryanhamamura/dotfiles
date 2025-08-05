#!/bin/bash 

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 
gsettings set org.gnome.desktop.interface cursor-theme 'Yaru' 
gsettings set org.gnome.desktop.interface gtk-theme "Yaru-$THEME_COLOR-dark" 
gsettings set org.gnome.desktop.interface icon-theme "Yaru-$THEME_COLOR" 
gsettings set org.gnome.desktop.interface accent-color "$THEME_COLOR" 2>/dev/null || true 


