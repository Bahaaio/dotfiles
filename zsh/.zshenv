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

# bin
export PATH="$HOME/.local/bin:$PATH"

# golang
export GOPATH="$HOME/.local/share/go"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# Toolbox
export PATH="$HOME/.local/share/JetBrains/Toolbox/scripts:$PATH"
