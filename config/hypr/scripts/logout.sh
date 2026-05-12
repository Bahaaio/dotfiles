#!/usr/bin/env bash

nohup bash -c "sleep 2 && uwsm stop" >/dev/null 2>&1 &

# close all windows
hyprctl clients -j | jq -r ".[].address" | xargs -I{} hyprctl dispatch closewindow address:{}

# Move to first workspace
hyprctl dispatch workspace 1

sleep 1 # Allow apps like Chrome to shutdown correctly
