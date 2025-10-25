#
#  ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
#  ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#    ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#   ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
#  ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝
# Bahaaio

# default applications
export TERMINAL='wezterm'
export BROWSER='zen'
export EDITOR='nvim'

# XDG base directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# bin
export PATH="$HOME/.local/bin:$PATH"

# fzf
export FZF_DEFAULT_OPTS='--layout reverse --border'
export FZF_ALT_C_OPTS="--preview 'lsd --tree --color=always --icon=always --depth=1 {}'"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"

# node.js
export NPM_CONFIG_CACHE="$XDG_DATA_HOME/npm"
export FNM_PATH="$XDG_DATA_HOME/fnm"
export PATH="$FNM_PATH:$PATH"

# golang
export GOPATH="$HOME/.local/share/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$CARGO_HOME/bin:$PATH"

# Toolbox
export PATH="$XDG_DATA_HOME/JetBrains/Toolbox/scripts:$PATH"
