#!/bin/bash

# Iterate through each directory in dotfiles/
for dir in */; do
    # Check if the directory contains files before running stow
    if [ -d "$dir" ]; then
        echo "Stowing $dir..."
        stow "$dir"
    fi
done

echo "Dotfiles installation complete!"
