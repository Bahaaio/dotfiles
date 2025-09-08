#!/usr/bin/env bash

# Automated dotfiles installation script
# https://github.com/Bahaaio/dotfiles
#
# Installs dotfiles, fonts, and wallpapers
# Doesn't install software - only symlinks dotfiles and downloads assets
# Uses stow for symlink management and supports minimal installation mode
# Compatible with apt, pacman, and dnf package managers
# Author: Bahaaio

set -e
trap 'echo "ERROR: Setup failed at line $LINENO"' ERR

spinner() {
    local title="$1"
    shift
    gum spin --title "$title" -- "$@"
}

info() {
    gum log --level info "$@"
}

warn() {
    gum log --level warn "$@"
}

install() {
    if command -v apt >/dev/null 2>&1; then
        sudo apt install -y "$@" >/dev/null 2>&1
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S "$@" >/dev/null 2>&1
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y "$@" >/dev/null 2>&1
    else
        exit 1
    fi
}

dotfiles_dir="$HOME/dotfiles"
dotfiles_repo="https://github.com/Bahaaio/dotfiles.git"

wallpapers_dir="$HOME/Pictures/wallpapers"
wallpapers_repo="https://github.com/Bahaaio/wallpapers.git"

# Install dependencies
echo "Updating package index..."
sudo apt update >/dev/null 2>&1

echo "Installing dependencies..."
install git stow gum

info "Installed dependencies"

minimal=false
if gum confirm "Minimal installation (symlink dotfiles only)? "; then
    minimal=true
fi

# == install dotfiles ==
if [ -d "$dotfiles_dir" ]; then
    warn "Backing up $dotfiles_dir to $dotfiles_dir.backup"
    mv "$dotfiles_dir" "$dotfiles_dir.backup.$(date +%s)"
fi

spinner "Cloning dotfiles..." git clone "$dotfiles_repo" "$dotfiles_dir"
info "Cloned dotfiles into $dotfiles_dir"
cd "$dotfiles_dir"

chmod +x install.sh
spinner "Installing dotfiles" ./install.sh
info "Installed dotfiles"

if $minimal; then
    info "Minimal installation complete"
    exit 0
fi

# == install fonts ==
spinner "Installing unzip" install unzip
spinner "Installing wget" install wget

spinner "Installing JetBrains Mono..." ~/.local/bin/install-jetbrains-mono.sh
info "Installed JetBrains Mono Nerd Font"

# == install wallpapers ==
if [ -d "$wallpapers_dir" ]; then
    warn "Backing up $wallpapers_dir to $wallpapers_dir.backup"
    mv "$wallpapers_dir" "$wallpapers_dir.backup.$(date +%s)"
fi

spinner "Cloning wallpapers..." git clone "$wallpapers_repo" "$wallpapers_dir"
info "Cloned wallpapers into $wallpapers_dir"

info "Installation complete"
