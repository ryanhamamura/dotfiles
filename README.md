# Ryan Hamamura's dotfiles

This is a collection of configuration files for the tools that I like to use during software development: Neovim, Mise, and Alacritty. I mainly use Ubuntu Desktop 24.04, so a lot of the configuration is Ubuntu/Debian specific. 

## Dotfile management 
This project uses [GNU Stow](https://www.gnu.org/software/stow/) to create symlinks from this repository to your $HOME directory. 

## Setup
>**NOTE:** This script will ask for sudo permissions, which are used for various install and file moving tasks. 

```sh 
git clone https://github.com/ryanhamamura/dotfiles.git
cd dotfiles 
source ./setup.sh
```

