# Dotfiles Role

Links dotfiles and clones wallpapers repository.

## What it does

- Clones wallpapers repository to `~/Pictures/wallpapers` (if not exists)
- Runs `link.sh` script to symlink dotfiles using GNU Stow
- Sets zsh as default shell

Symlinks are created for zsh, home, bin, config, and apps directories.
