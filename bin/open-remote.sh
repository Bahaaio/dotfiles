#!/bin/bash

# opens the remote URL of the git repository in the current tmux pane

cd "$(tmux run "echo #{pane_start_path}")" || exit 1
xdg-open "$(git remote get-url origin)" || echo "No remote found"
