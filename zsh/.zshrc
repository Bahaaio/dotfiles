neofetch | lolcat

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# enable command auto-correction.
# ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
plugins=(sudo zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.aliases.zsh

# man page custom colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Set FZF options for layout and border
export FZF_DEFAULT_OPTS='--layout reverse --border'
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--preview 'tree -c {}'"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Function to get files or directories while ignoring patterns from the ignore file
get_files() {
    local type=$1
    local search_dir=${2:-.}  # Default to current directory if no argument is provided
    if [[ $type == "d" ]]; then
        # Get directories
        find "$search_dir" -type d | grep -v -f ~/.config/fzf/fzf-ignores.txt | sed "s|^\./||"
    else
        # Get files (default to regular files)
        find "$search_dir" -type f | grep -v -f ~/.config/fzf/fzf-ignores.txt | sed "s|^\./||"
    fi
}

# Function to change directory using fzf
f() {
    local dir
    if [[ -n $1 ]]; then
        dir=$(get_files "d" "$1" | fzf --height 60%)
    else
        dir=$(get_files "d" | fzf --height 60%)
    fi
    if [[ -n $dir ]]; then
        cd "$dir" || return
    fi
}

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# rofi scripts
export PATH=$HOME/.config/rofi/scripts:$PATH

# browser
export BROWSER='brave-browser'

# editor
export EDITOR='nvim'

# golang path
export PATH=$PATH:/usr/local/go/bin

# golang bins (bootdev path)
export PATH=$PATH:$HOME/go/bin

# c++ 
export PATH=$PATH:/usr/include/c++/

# java JDK stuff
export JAVA_HOME="/home/bahaa/.jdks/openjdk-23"
export PATH="$JAVA_HOME/bin/:$PATH"

# terminal
export TERMINAL='wezterm'
