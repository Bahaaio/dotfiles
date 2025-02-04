# Dotfiles

My personal configuration files for various tools.

```
       __      __  _____ __
  ____/ /___  / /_/ __(_) /__  _____
 / __  / __ \/ __/ /_/ / / _ \/ ___/
/ /_/ / /_/ / /_/ __/ / /  __(__  )
\__,_/\____/\__/_/ /_/_/\___/____/

BahaaMohamed98
```

## Requirments

Make sure you have [git](https://git-scm.com/) and [GNU stow](https://www.gnu.org/software/stow/) installed

```sh
sudo apt update
sudo apt install git stow
```

## Installation

First, clone the dotfiles repository into your home directory

```sh
cd ~
git clone https://github.com/BahaaMohamed98/dotfiles.git
cd dotfiles
```

then use the [install.sh](install.sh) to create the symlinks

```sh
chmod +x install.sh 
./install.sh
```

---
