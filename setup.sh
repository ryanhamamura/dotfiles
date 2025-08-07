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
[ -f ~/.zshrc ] && [ ! -L ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak 
[ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
[ -d ~/.config/ohmyposh ] && [ ! -L ~/.config/ohmyposh ] && mv ~/.config/ohmyposh ~/.config/ohmyposh.bak
stow -v --adopt -t $HOME home

# Setup Neovim plugins
if command -v nvim &> /dev/null; then
  echo "Installing Neovim plugins..."
  nvim --headless "+Lazy sync" +qa 
fi

# Set zsh as default shell
if command -v zsh &> /dev/null; then
  # Add zsh to valid shells if not already there
  if ! grep -q "$(which zsh)" /etc/shells; then
    echo "$(which zsh)" | sudo tee -a /etc/shells 
  fi
  
  # Change default shell to zsh if not already set
  if [ "$SHELL" != "$(which zsh)" ]; then
    sudo chsh -s "$(which zsh)" "$(whoami)"
    echo "Default shell changed to zsh. Please restart your terminal or run 'zsh' to use your new shell"
  else
    echo "Zsh is already your default shell"
  fi
fi

echo "Setup complete!"
