# [Zsh](https://www.zsh.org/)

My Zsh configuration setup

## Installation

```sh
sudo apt install -y zsh nala lsd ripgrep fd-find fzf xclip bat

# symlink to fd (debian thing)
ln -s $(which fdfind) ~/.local/bin/fd

# Set zsh as default shell
chsh -s $(which zsh)
```

## Requirements

### [zoxide](https://github.com/ajeetdsouza/zoxide)

```sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

## Optional

```sh
sudo apt install btop tty-clock
```

---
