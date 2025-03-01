# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins 
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Load completions
autoload -U compinit && compinit

# fzf-tab needs to be after compinit apparently
zinit light Aloxaf/fzf-tab

# Source oh-my-posh 
export PATH=$HOME/.local/bin:$PATH
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
bindkey -e 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim=nvim

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# set PATH so it includes /usr/local/go/bin if it exists 
if [ -d "/usr/local/go/bin" ] ; then 
  PATH="/usr/local/go/bin:$PATH"
fi

# Setting Go variables
export GOROOT_BOOTSTRAP=/usr/lib/go-1.20
export GOROOT=$HOME/goroot
export GOPATH=$HOME/go  # where executables outside the Go distribution are installed using the go command
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# Go-env 
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"
