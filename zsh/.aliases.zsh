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

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
-() { cd - }

# core-utils
alias rm='trash'
alias cp='cp -iv'
alias mv='mv -iv'
alias c='clear'
alias cat='batcat'
alias rg='rg --hidden --follow'
alias less='less -R'
man() { command man "$@" | batcat -pl man; }

# nala
alias install='sudo nala install'
alias remove='sudo nala remove'
alias update='sudo nala upgrade'
alias undo='sudo nala undo'
alias show='nala show'
alias search='nala search'
alias purge='sudo nala purge'
alias list='sudo nala list -u'
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
alias y='yazi'
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias leet='nvim leetcode.nvim'
alias rest='pomo break'
alias clock='tty-clock -c -s -b -t -C 6'
alias ld='lazydocker'
alias lg='lazygit'
alias t='~/.local/bin/tmux-sessionizer.sh'

# exercism
alias es='exercism submit'
alias ej='exercism submit ./src/main/java/*.java'

# tlp
alias charge='sudo tlp fullcharge'
