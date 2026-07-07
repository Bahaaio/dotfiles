#
#  ███████╗███████╗██╗  ██╗███████╗███╗   ██╗██╗   ██╗
#  ╚══███╔╝██╔════╝██║  ██║██╔════╝████╗  ██║██║   ██║
#    ███╔╝ ███████╗███████║█████╗  ██╔██╗ ██║██║   ██║
#   ███╔╝  ╚════██║██╔══██║██╔══╝  ██║╚██╗██║╚██╗ ██╔╝
#  ███████╗███████║██║  ██║███████╗██║ ╚████║ ╚████╔╝
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝  ╚═══╝
# Bahaaio

typeset -U path PATH

# default applications
export TERMINAL="wezterm"
export BROWSER="zen"
export EDITOR="nvim"

# XDG base directories
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# bin
export PATH="$HOME/.local/bin:$PATH"

# node.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

# golang
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$CARGO_HOME/bin:$PATH"
