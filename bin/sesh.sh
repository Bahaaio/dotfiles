#!/usr/bin/bash

sesh connect "$(
  sesh list --icons | fzf-tmux -p 80%,70% \
    --no-sort --reverse --ansi --border-label ' sesh ' \
    --header '[a]ll [t]mux confi[g]s zo[x]ide [f]ind [d]elete' \
    --bind 'ctrl-a:reload(sesh list --icons)' \
    --bind 'ctrl-t:reload(sesh list -t --icons)' \
    --bind 'ctrl-g:reload(sesh list -c --icons)' \
    --bind 'ctrl-x:reload(sesh list -z --icons)' \
    --bind 'ctrl-f:reload(fd -H -d 2 -t d . ~ ~/code ~/dotfiles ~/Documents)' \
    --bind 'ctrl-d:execute(tmux kill-session -t {2..})+reload(sesh list --icons)' \
    --preview 'sesh preview {}'
)"
