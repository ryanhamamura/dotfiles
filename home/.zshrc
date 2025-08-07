# ZSH Configuration
# This file sources modular configuration files from ~/.config/zsh/

# Set config directory
ZSH_CONFIG="${HOME}/.config/zsh"

# Source all configuration modules in order
for config in ${ZSH_CONFIG}/*.zsh; do
  source "$config"
done