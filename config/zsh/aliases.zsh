#
#   █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
#  ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
#  ███████║██║     ██║███████║███████╗█████╗  ███████╗
#  ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
#  ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
#  ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
# Bahaaio

# ls
alias ls='eza --icons=auto'
alias l='ls -lah'
alias la='ls -A'
alias lt='ls --tree'
alias lta='ls --tree -a'
alias lc='ls --code=both'

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
alias diff='delta --dark'
alias less='less -R'
alias ports='ss -tulpn'
man() { command man "$@" | bat -plman }

# nix
alias ns='nh os switch'
alias nu='nh os switch --update'
alias gc='nh clean all --optimise'
alias s='nh search'
alias ne="nvim $NH_FLAKE"

# zsh
alias src="source $ZDOTDIR/.zshrc"
alias e="nvim $ZDOTDIR/.zshrc"
alias ee="nvim $ZDOTDIR/.zshenv"
alias ea="nvim $ZDOTDIR/aliases.zsh"
alias ef="nvim $ZDOTDIR/functions.zsh"
alias anon='unset HISTFILE'

# utils
alias ai='opencode'
alias vim='nvim'
alias leet='nvim leetcode.nvim'
alias clock='tty-clock -csbtC4'
alias ld='lazydocker'
alias lg='lazygit'
alias t='~/.local/bin/sesh.sh'
alias es='exercism submit'
alias charge='sudo tlp fullcharge'

# help
alias -g -- --help='--help 2>&1 | bat -plhelp'

# clipboard
if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  alias copy='wl-copy'
  alias paste='wl-paste'
else
  alias copy='xclip -selection clipboard'
  alias paste='xclip -selection clipboard -o'
fi
