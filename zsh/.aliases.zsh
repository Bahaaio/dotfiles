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

# nala
alias i='sudo nala install'
alias u='sudo nala upgrade'
alias show='nala show'
alias search='nala search'
alias purge='sudo nala purge'
alias list='sudo nala list -u'
alias remove='sudo nala remove'
alias autoremove='sudo nala autoremove --purge'

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
alias ex='exercism'
alias es='exercism submit'
alias ej='exercism submit ./src/main/java/*.java'

# tlp
alias charge='sudo tlp fullcharge'

# nvim
alias cvim='NVIM_APPNAME=NvChad nvim'
