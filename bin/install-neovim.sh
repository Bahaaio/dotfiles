#!/usr/bin/env bash

set -euo pipefail

NEOVIM_DIR="$HOME/github/neovim"
STARTING_DIR="$(pwd)"

if [[ -d "$NEOVIM_DIR/.git" ]]; then
  echo "neovim already exists at $NEOVIM_DIR, pulling latest changes..."
  cd "$NEOVIM_DIR"
  git pull
else
  git clone https://github.com/neovim/neovim.git "$NEOVIM_DIR"
fi

echo "installing dependencies..."
sudo apt install -y ninja-build gettext cmake curl build-essential

echo "building neovim..."
cd "$NEOVIM_DIR"
make CMAKE_BUILD_TYPE=Release
sudo make install

cd "$STARTING_DIR"

echo "neovim installed successfully!"
nvim --version
