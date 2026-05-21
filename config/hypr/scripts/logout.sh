#!/usr/bin/env bash

nohup bash -c "sleep 2 && uwsm stop" >/dev/null 2>&1 &

# close all windows
hyprctl clients -j | jq -r ".[].address" | xargs -I{} hyprctl dispatch closewindow address:{}
sleep 1
