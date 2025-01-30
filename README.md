# Dotfiles

My personal configuration files for various tools.

## Requirments

Make sure you have git and GNU stow installed

```sh
sudo apt update
sudo apt install git stow
```

## Installation

First, clone the dotfiles repository in your home directory

```sh
cd ~
git clone https://github.com/BahaaMohamed98/dotfiles.github
cd dotfiles
```

then use the [install.sh](install.sh) to create the symlinks

```sh
chmod +x install.sh 
./install.sh
```
