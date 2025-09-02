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

# rofi
export PATH=$HOME/.config/rofi/scripts:$PATH

# golang
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# Toolbox
export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"

# rust
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
