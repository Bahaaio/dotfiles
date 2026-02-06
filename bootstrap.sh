#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="https://github.com/Bahaaio/dotfiles.git"

echo "### Debian Environment Bootstrap ###"
echo ""

# Check if running on Debian-based system
if ! command -v apt &>/dev/null; then
  echo "Error: This script requires a Debian-based system with apt"
  exit 1
fi

echo "==> Installing git and ansible..."
sudo apt update
sudo apt install -y git ansible

# Clone dotfiles if not already present
if [ ! -d "$DOTFILES_DIR" ]; then
  echo ""
  echo "==> Cloning dotfiles repository..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  echo ""
  echo "==> Dotfiles directory already exists at $DOTFILES_DIR"
fi

# Run ansible playbook
echo ""
echo "==> Running Ansible playbook..."
cd "$DOTFILES_DIR/ansible"
ansible-playbook playbook.yml --ask-become-pass

echo ""
echo "### Bootstrap Complete! ###"
echo ""
echo "Reboot for system changes to apply"
