#!/bin/env bash

# dotfiles install script
# symlinks files from dotfiles to home directory

set -e

stow zsh
stow home
stow bin --target="$HOME/.local/bin/"
stow config --target="$HOME/.config/"
