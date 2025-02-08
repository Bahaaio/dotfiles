# ls
alias ls='lsd'
alias ll='ls -lh'
alias l='ls -l'
alias la='ls -A'
alias lla='ls -lAh'
alias lt='ls --tree'
alias lta='ls --tree -a'

alias cp='cp -iv'
alias mv='mv -iv'
alias ..='cd ..'
alias cl='clear'

# history
alias hs='history | grep'
alias hl='history | less'

# apt
alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias remove='sudo apt remove'
alias purge='sudo apt purge'
alias install='sudo apt install'
alias show='apt show'
alias autoremove='sudo apt autoremove --purge'
alias list='sudo apt list'

# utils
alias cat='batcat'
alias top='btop'
alias clip='clipcopy'
alias src='source ~/.zshrc'
alias copy='clipcopy'
alias paste='clippaste'
alias copypath='pwd | clipcopy; echo "current path was copied to the clipboard."'
alias clock='tty-clock -c -s -b -t'
alias leetcode='nvim leetcode.nvim'
alias vim='nvim'

# git
alias gc='git clone'
alias gc1='git clone --depth=1'
