# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

```sh
sudo apt install git stow zsh
```
### Verify installation
```sh
zsh --version
# Expected result: 5.0.8 or newer
```
### Install oh-my-posh
```sh
curl -s https://ohmyposh.dev/install.sh | bash -s
```

### Make zsh the default shell
```sh
chsh -s $(which zsh)
# If you are on Fedora, use sudo chsh $USER for recent versions or sudo lchsh $USER for older versions.
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git. Ensure 
the original dotfiles have been removed before stowing. 

```sh
git clone git@github.com:ryanhamamura/dotfiles.git
cd dotfiles
```
### Ensure existing config files are backed up
```sh 
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.config/ohmyposh ~/.config/ohmyposh.bak
mv ~/.zshrc ~/.zshrc.bak 
```
then use GNU stow to create symlinks

```sh
stow .
```

Log out and log back in



