# Ryan Hamamura's dotfiles

This is a collection of configuration files for the tools that I like to use during software development: Alacritty, TMUX, and Neovim (LazyVim), . I mainly use Ubuntu Desktop 24.04, so a lot of the configuration is Ubuntu/Debian specific. 

## Dotfile management 
This project uses [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks from this repository to your $HOME directory. 

## Setup
>**NOTE:** This script will ask for sudo permissions, which are used for various install and file moving tasks. 

```sh 
git clone https://github.com/ryanhamamura/dotfiles.git
cd dotfiles 
source ./setup.sh
```


## TMUX 
### Keybindings
> See https://github.com/tmux-plugins/tpm for more.

**Installing plugins**
1. Add a new plugin to `tmux.conf` with `set -g @plugin '...'`.
2. Press `prefix` + `I` to fetch and install the plugins.
All the plugins are installed to `~/.config/tmux/plugins/`.

**Updating plugins**
`prefix` + `U`

**Uninstalling plugins**
1. Remove (or comment out) plugin from te list in `tmux.conf`. 
2. Press `prefix` + `alt` + `u` to remove the commented out plugin(s).


