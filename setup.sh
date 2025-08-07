#!/bin/bash 

set -e 

require() {
  command -v "${1}" &>/dev/null && return 0
  printf "Missing required application: %s\n" "${1}" >&2
  return 1
}

# Install Desktop software if running Gnome 
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source install/terminal.sh

  # Install desktop tools and tweaks
  source install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source install/terminal.sh
fi


echo "Backing up any existing dotfiles..." 
mv ~/.zshrc ~/.zshrc.bak 
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.config/ohmyposh ~/.config/ohmyposh.bak
stow -v --adopt -t $HOME home

# **Untested**
# nvim --headless "+Lazy sync" +qa 
#
# echo "$(which zsh)" | sudo tee -a /etc/shells 
# sudo chsh -s "$(which zsh)" "$(whoami)" 
# echo "Done! Please restart your terminal or run 'zsh' to use your new shell"
