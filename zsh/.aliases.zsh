# ls
alias ls='lsd'
alias ll='ls -lh'
alias l='ls -l'
alias la='ls -A'
alias lla='ls -lAh'
alias lt='ls --tree'
alias lta='ls --tree -a'

# system
alias s='sudo'
alias cp='cp -iv'
alias mv='mv -iv'
alias cl='clear'

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
alias e='nvim ~/.zshrc'
alias ea='nvim ~/.aliases.zsh'
alias copy='clipcopy'
alias paste='clippaste'
alias copypath='pwd | clipcopy; echo "current path was copied to the clipboard."'
alias clock='tty-clock -c -s -b -t -C 6'
alias leetcode='nvim leetcode.nvim'
alias vim='nvim'

# tlp
alias charge='sudo tlp fullcharge'

# nvim
alias cvim='NVIM_APPNAME=NvChad nvim'
