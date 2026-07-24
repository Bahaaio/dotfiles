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
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit
ZINIT_HOME="$XDG_DATA_HOME/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# plugins
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# snippets
zinit snippet OMZP::sudo

# completions
autoload -Uz compinit
compinit -C -d "$XDG_CACHE_HOME/zcompdump"

# prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion styling
eval "$(dircolors -b)" # Enable colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Enable ls colors
zstyle ':completion:*' menu no # disable zsh menu
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'l:|=* r:|=*' # Case-insensitive + substring matching
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree -L1 --icons --color=always $realpath'
zstyle ':completion:*' sort false # disable sorting (preserve order)
zstyle ':completion:*:cd:*' sort true # enable sorting for cd completions

# keybindings
bindkey -e # emacs key bindings
bindkey '^n' history-search-forward
bindkey '^p' history-search-backward

# edit command line in $EDITOR
autoload -z edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# ============================================================================
# SHELL OPTIONS & HISTORY
# ============================================================================

HISTSIZE=100000                         # maximum history lines kept in memory
SAVEHIST=$HISTSIZE                      # maximum history lines saved to histfile
HISTFILE="$XDG_STATE_HOME/.zsh_history" # history file location
setopt hist_expire_dups_first           # delete duplicate commands first when trimming history
setopt hist_ignore_dups                 # ignore duplicated commands history list
setopt hist_ignore_space                # ignore commands that start with space
setopt hist_reduce_blanks               # strip extra spaces before saving
setopt share_history                    # share history between all running sessions
setopt autocd                           # auto-cd when typing dir name
setopt globdots                         # include dotfiles in glob pattersn
setopt interactive_comments             # allow comments in interactive shell

# ============================================================================
# EXTERNAL CONFIGS
# ============================================================================

# Load aliases and functions
source ~/.aliases.zsh
source ~/.functions.zsh

# ============================================================================
# TOOL INITIALIZATION
# ============================================================================

# fzf
export FZF_DEFAULT_OPTS='--reverse --border'
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"
