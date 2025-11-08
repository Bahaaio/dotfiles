#!/usr/bin/bash

# Script to manage tmux sessions

DIRECTORIES=(~/ ~/code ~/dotfiles ~/Documents) # to be searched for projects
PATHS=(~/dotfiles ~/.config)                   # specific paths to include
DEPTH=2                                        # depth for searching directories

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(
        {
            printf '%s/\n' "${PATHS[@]}"
            fd . "${DIRECTORIES[@]}" --max-depth="$DEPTH" --type=d
        } |
            sed "s|^$HOME/||" |
            sort -u |
            fzf --preview "lsd --tree --depth=1 --color=always --icon=always $HOME/{}"
    )

    [[ -n "$selected" ]] && selected="$HOME/$selected"
fi

[[ -z "$selected" ]] && exit 0

session_name=$(basename "$selected" | tr . _)

if [[ -z "$TMUX" ]]; then
    exec tmux new -A -s "$session_name" -c "$selected"
    exit 0
fi

if ! tmux has -t "$session_name" 2>/dev/null; then
    tmux new -ds "$session_name" -c "$selected"
fi

tmux switch-client -t "$session_name"
