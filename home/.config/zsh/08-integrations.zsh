# FZF integration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Mise (formerly rtx) - Modern runtime version manager
if ! command -v ~/.local/bin/mise &> /dev/null; then 
  echo "mise not found. Installing mise..."
  mkdir -p ~/.local/bin 
  curl -fsSL https://mise.run | sh 
  echo "mise has been installed successfully!" 
fi

if [ -f ~/.local/bin/mise ]; then 
  eval "$(~/.local/bin/mise activate zsh)"
fi