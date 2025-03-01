# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

```sh
sudo apt install git stow zsh golang-1.20
```
### Verify installation
```sh
zsh --version
# Expected result: 5.0.8 or newer
```
### Install neovim from source
```sh
# Ubuntu/Debian
sudo apt-get install ninja-build gettext cmake curl build-essential

git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
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

## Installing Go from source
```sh
cd ~/
git clone https://go.googlesource.com/go goroot
cd goroot
git checkout <tag>
```
Use `git tag -n` to view latest tags. 

### Build
```sh 
cd src 
./all.bash
```

If successful, print output will look like this: 
``` 
ALL TESTS PASSED

---
Installed Go for linux/amd64 in /home/you/go.
Installed commands in /home/you/go/bin.
*** You need to add /home/you/go/bin to your $PATH. ***
```

## Go-env 
- Similar to `pyenv` for Python, `goenv` is lightweight. 
- **Installation:** 
```sh 
git clone https://github.com/go-nv/goenv.git ~/.goenv 
```
- **Usage:**
  - List versions: `goenv install -l`
  - Install a version: `goenv install 1.22.7`
  - Set globally: `goenv global 1.21.6`
  - Set locally (per project): `goenv local 1.20.4`

