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

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz compinit && compinit # completions

# p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# snippets
zinit snippet OMZP::sudo

# prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion styling
eval "$(dircolors -b)" # Enable colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Enable ls colors
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case-insensitive matching
# zstyle ':completion:*' menu select # Enable menu selection
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --tree --depth=1 --color=always $realpath'

# keybindings
bindkey -e # emacs key bindings
# bindkey -v # vi key bindings
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# ============================================================================
# SHELL OPTIONS & HISTORY
# ============================================================================

HISTSIZE=100000                      # maximum history lines kept in memory
SAVEHIST=$HISTSIZE                   # maximum history lines saved to histfile
HISTFILE="$HOME/.cache/.zsh_history" # move histfile to cache
setopt hist_expire_dups_first        # delete duplicate commands first when trimming history
setopt hist_ignore_dups              # ignore duplicated commands when adding to history
setopt SHARE_HISTORY                 # share command history between all sessions
setopt HIST_REDUCE_BLANKS            # strip extra spaces before saving
setopt autocd                        # auto-cd when typing dir name
setopt globdots                      # include dotfiles
setopt interactive_comments          # allow comments in interactive shell

# ============================================================================
# EXTERNAL CONFIGS
# ============================================================================

# Load aliases and functions
source ~/.aliases.zsh
source ~/.functions.zsh

# ============================================================================
# TOOL INITIALIZATION (keep at end for performance)
# ============================================================================

# fzf
source <(fzf --zsh)
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
  eval "$(fnm env)"
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
