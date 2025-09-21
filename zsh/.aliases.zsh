#
#   █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#  ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#  ███████║██║     ██║███████║███████╗█████╗  ███████╗
#  ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#  ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
# Bahaaio

# ls
alias ls='lsd'
alias l='ls -lah'
alias la='ls -A'
alias lt='ls --tree'
alias lta='ls --tree -a'

# core-utils
alias rm='trash'
alias cp='cp -iv'
alias mv='mv -iv'
alias c='clear'
alias cat='batcat'
alias rg='rg --hidden --follow'

# nala
alias install='sudo nala install'
alias update='sudo nala upgrade'
alias list='sudo nala list -u'
alias show='nala show'
alias search='nala search'
alias purge='sudo nala purge'
alias remove='sudo nala remove'
alias autoremove='sudo nala autoremove --purge'

# zsh
alias src='source ~/.zshrc'
alias e='nvim ~/.zshrc'
alias ee='nvim ~/.zshenv'
alias ea='nvim ~/.aliases.zsh'
alias ef='nvim ~/.functions.zsh'

# utils
alias ai='opencode'
alias vim='nvim'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias leet='nvim leetcode.nvim'
alias rest='pomo break'
alias clock='tty-clock -c -s -b -t -C 6'

# exercism
alias es='exercism submit'
alias ej='exercism submit ./src/main/java/*.java'

# tlp
alias charge='sudo tlp fullcharge'
