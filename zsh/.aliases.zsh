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
alias cat='bat'
alias rg='rg --glob="!.git" --hidden --follow'
alias diff='delta --dark'
alias less='less -R'
man() { command man "$@" | bat -plman }

# nix
alias ns='nh os switch'
alias nu='nh os switch --update'
alias gc='nh clean all --optimise'
alias s='nh search'
alias ne="nvim $NH_FLAKE"

# zsh
alias src='source ~/.zshrc'
alias e='nvim ~/.zshrc'
alias ee='nvim ~/.zprofile'
alias ea='nvim ~/.aliases.zsh'
alias ef='nvim ~/.functions.zsh'
alias anon='unset HISTFILE'

# utils
alias ai='opencode'
alias vim='nvim'
alias leet='nvim leetcode.nvim'
alias clock='tty-clock -csbtC6'
alias ld='lazydocker'
alias lg='lazygit'
alias t='~/.local/bin/sesh.sh'

# help
alias -g -- -h='-h 2>&1 | bat -plhelp'
alias -g -- --help='--help 2>&1 | bat -plhelp'

# clipboard
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  alias copy='wl-copy'
  alias paste='wl-paste'
else
  alias copy='xclip -selection clipboard'
  alias paste='xclip -selection clipboard -o'
fi

# exercism
alias es='exercism submit'
alias ej='exercism submit ./src/main/java/*.java'

# tlp
alias charge='sudo tlp fullcharge'
