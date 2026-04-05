#!/usr/bin/bash

# kill session or remove zoxide entry
# shellcheck disable=SC2016
DELETE_CMD='s={2..}; tmux kill-session -t "$s" || zoxide remove "${s/#\~/$HOME}"'

sesh connect "$(
  sesh list --icons | fzf-tmux -p 80%,70% \
    --no-sort --reverse --ansi --border-label ' sesh ' \
    --header '[a]ll [t]mux confi[g]s zo[x]ide [f]ind [d]elete' \
    --bind 'ctrl-a:reload(sesh list --icons)' \
    --bind 'ctrl-t:reload(sesh list -t --icons)' \
    --bind 'ctrl-g:reload(sesh list -c --icons)' \
    --bind 'ctrl-x:reload(sesh list -z --icons)' \
    --bind 'ctrl-f:reload(fd -H -d 2 -t d . ~ ~/code ~/dotfiles ~/Documents)' \
    --bind "ctrl-d:execute-silent($DELETE_CMD)+reload(sesh list --icons)" \
    --preview 'sesh preview {}'
)"
