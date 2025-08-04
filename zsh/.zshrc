# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# omz
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(sudo zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# aliases
source ~/.aliases.zsh

# Delete duplicate commands first when trimming history
setopt hist_expire_dups_first
# Ignore duplicated commands when adding to history
setopt hist_ignore_dups
# Share command history between all sessions
setopt SHARE_HISTORY

# man page colors
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf options
export FZF_DEFAULT_OPTS='--layout reverse --border'
export FZF_ALT_C_OPTS="--preview 'tree -c {}'"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# default applications
export TERMINAL='wezterm'
export BROWSER='brave-browser'
export EDITOR='nvim'
# export MANPAGER='nvim +Man!'

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# exercism cd to downloaded exercise
exercism () {
    if [[ $1 == "download" ]]; then
        local out=()
        while IFS= read -r line; do
            out+=("$line")
        done < <(command exercism "$@")

        printf '%s\n' "${out[@]}"
        [[ -d "${out[-1]}" ]] && cd "${out[-1]}"

        # navigate to java main if exists
        if [[ -d "./src/main/java" ]]; then
            # enable all tests
            find ./src/test/java/ -name '*.java' | xargs sed -i '/@Disabled/d'

            command idea .
        fi
    else
        command exercism "$@"
    fi
}

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
