#!/usr/bin/env bash

# dotfiles install script
# symlinks files from dotfiles to home directory

set -e

# create required directories if they don't exist
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

stow zsh
stow bin --target="$HOME/.local/bin/"
stow config --target="$HOME/.config/"
