#
#  ███████╗███████╗██╗  ██╗██████╗  ██████╗
#  ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#    ███╔╝ ███████╗███████║██████╔╝██║
#   ███╔╝  ╚════██║██╔══██║██╔══██╗██║
#  ███████╗███████║██║  ██║██║  ██║╚██████╗
#  ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
# Bahaaio

# ============================================================================
# ZSH CORE CONFIGURATION
# ============================================================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(sudo zsh-autosuggestions zsh-syntax-highlighting zsh-interactive-cd)
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ============================================================================
# SHELL OPTIONS & HISTORY
# ============================================================================

# Delete duplicate commands first when trimming history
setopt hist_expire_dups_first
# Ignore duplicated commands when adding to history
setopt hist_ignore_dups
# Share command history between all sessions
setopt SHARE_HISTORY

# ============================================================================
# EXTERNAL CONFIGS
# ============================================================================

# Load aliases and functions
source ~/.aliases.zsh
source ~/.functions.zsh

# ============================================================================
# TOOL INITIALIZATION (keep at end for performance)
# ============================================================================

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf configuration
export FZF_DEFAULT_OPTS='--layout reverse --border'
export FZF_ALT_C_OPTS="--preview 'tree -c {}'"
export FZF_ALT_C_COMMAND="fd --type d"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# SDKMAN (lazy loaded)
export SDKMAN_DIR="$HOME/.sdkman"
sdk() {
    unset -f sdk # prevents sdk from being loaded twice
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk "$@"
}

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# lazy load pnpm completions
pnpm() {
    unset -f pnpm
    eval "$(command pnpm completion zsh)"
    pnpm "$@"
}
