# ls
alias ls='lsd'
alias l='ls -lh'
alias la='ls -A'
alias lla='ls -lAh'
alias lt='ls --tree'
alias lta='ls --tree -a'

# core-utils
alias cp='cp -iv'
alias mv='mv -iv'
alias cl='clear'
alias cat='batcat'
alias rg='rg --hidden'

# nala
alias i='sudo nala install'
alias u='sudo nala upgrade'
alias purge='sudo nala purge'
alias list='sudo nala list -u'
alias remove='sudo nala remove'
alias autoremove='sudo nala autoremove --purge'

# zsh
alias src='source ~/.zshrc'
alias e='nvim ~/.zshrc'
alias ea='nvim ~/.aliases.zsh'

# utils
alias copy='clipcopy'
alias paste='clippaste'
alias clock='tty-clock -c -s -b -t -C 6'
alias leet='nvim leetcode.nvim'
alias ai='acli rovodev'

# exercism
alias es='exercism submit'
alias ej='exercism submit ./src/main/java/*.java'

# tlp
alias charge='sudo tlp fullcharge'

# nvim
alias vim='nvim'
