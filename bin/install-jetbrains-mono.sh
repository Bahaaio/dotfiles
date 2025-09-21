#!/bin/bash

set -e

# description: Installs the JetBrainsMono Nerd Font
# requires: unzip wget
# author: Bahaaio

cleanup() {
    [ -f "JetBrainsMono.zip" ] && rm -f JetBrainsMono.zip
}
trap cleanup EXIT

# Check if the font is already installed
if fc-list | grep -q "JetBrainsMono Nerd Font"; then
    echo "JetBrainsMono Nerd Font is already installed."
    exit 0
fi

# Download the latest JetBrainsMono Nerd Font
echo "Downloading JetBrainsMono Nerd Font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip

# Create local fonts directory if it doesn't exist
echo "Creating local fonts directory..."
mkdir -p ~/.local/share/fonts

# Extract into the fonts directory
echo "Extracting JetBrainsMono Nerd Font..."
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

# Remove the archive
echo "Removing JetBrainsMono Nerd Font archive..."
rm JetBrainsMono.zip

# Update the font cache
echo "Updating font cache..."
fc-cache -fv

echo "JetBrainsMono Nerd Font installed successfully!"
