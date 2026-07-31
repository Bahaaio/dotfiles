#!/usr/bin/env bash

# dotfiles install script
# symlinks files from dotfiles to home directory

set -e

# ensure .config exists and symlink config
mkdir -p "$HOME/.config"
stow config --target="$HOME/.config/"

# symlink .zshenv to home directory
ln -sfn "$HOME/.config/zsh/.zshenv" "$HOME/.zshenv"
