# [Zsh](https://www.zsh.org/)

My Zsh configuration setup

## Installation

```sh
sudo apt install zsh
```

## Requirements

### [oh-my-zsh](https://ohmyz.sh/)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### [powerlevel10k](https://github.com/romkatv/powerlevel10k)

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

### [fzf](https://github.com/junegunn/fzf)

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### [zoxide](https://github.com/ajeetdsouza/zoxide)

```sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

### Utilities

```sh
sudo apt install lsd xclip bat fzf lolcat nala
```

## Optional

```sh
sudo apt install btop tty-clock
```

---
