#!/bin/env bash

stow zsh
stow home
stow bin --target="$HOME/.local/bin/"
stow config --target="$HOME/.config/"
stow Pictures --target="$HOME/Pictures/"
