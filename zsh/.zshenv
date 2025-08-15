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
export BROWSER='brave-browser'
export EDITOR='nvim'
# export MANPAGER='nvim +Man!'

# binaries
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# rofi
export PATH=$HOME/.config/rofi/scripts:$PATH

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Toolbox
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# rust
. "$HOME/.cargo/env"
