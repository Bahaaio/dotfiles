#!/bin/bash

# exit on error
set -euo pipefail

dir="$HOME"/github/neovim

# remove previous installation
echo "removing previous clone..."
rm -rf "$dir"

# clone nvim
echo "cloning..."
git clone --depth 1 https://github.com/neovim/neovim.git "$dir"

# install dependencies
echo "installing dependencies..."
sudo apt update
sudo apt install -y ninja-build gettext cmake curl build-essential

# build and install
cd "$dir"
echo "building..."
make CMAKE_BUILD_TYPE=Release

echo "installing..."
sudo make install

# check version
echo "neovim installed successfully!"
echo "checking version..."
nvim --version
