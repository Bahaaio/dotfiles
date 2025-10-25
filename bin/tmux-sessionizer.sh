#!/usr/bin/env bash

# Script to manage tmux sessions

DIRECTORIES=(~/code ~/dotfiles ~/github)

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(
        fd . "${DIRECTORIES[@]}" --max-depth=2 --type=d |
            sed "s|^$HOME/||" |
            fzf --preview "lsd --tree --depth=1 --color=always --icon=always $HOME/{}"
    )

    [[ -n "$selected" ]] && selected="$HOME/$selected"
fi

[[ -z "$selected" ]] && exit 0

session_name=$(basename "$selected" | tr . _)

if ! tmux has -t "$session_name" 2>/dev/null; then
    tmux new -ds "$session_name" -c "$selected"
fi

tmux switch-client -t "$session_name"
