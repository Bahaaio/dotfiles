# Zsh

My Zsh configuration setup

## Requirements

### oh-my-zsh

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### powerlevel10k

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

### Utilities

```sh
sudo apt install lsd xclip batcat fzf
```

## Optional

```sh
sudo apt install btop tty-clock
```

---
