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
# export MANPAGER='nvim +Man!'

# XDG base directories
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

# bin
export PATH="$HOME/.local/bin:$PATH"

# golang
export GOPATH="$HOME/.local/share/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$CARGO_HOME/bin:$PATH"

# Toolbox
export PATH="$XDG_CONFIG_HOME/JetBrains/Toolbox/scripts:$PATH"
