#!/bin/bash

# Iterate through each directory in dotfiles/
for dir in */; do
    echo "Stowing $dir"
    stow "$dir"
done

echo "Dotfiles installation complete!"
