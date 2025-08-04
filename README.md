# Dotfiles

My personal setup for a clean and productive Linux environment.

## Screenshots

## Desktop

![Desktop](./assets/desktop.png)

## Terminal

![Terminal](./assets/terminal.png)

## Neovim

![Neovim](./assets/nvim.png)

---

## Requirements

You'll need [git](https://git-scm.com/) and [GNU stow](https://www.gnu.org/software/stow/)

```sh
sudo apt update
sudo apt install git stow
```

## Installation

Clone the repository into your home directory

```sh
cd ~
git clone https://github.com/BahaaMohamed98/dotfiles.git
cd dotfiles
```

Run [install.sh](install.sh) to symlink everything

```sh
chmod +x install.sh
./install.sh
```

---
