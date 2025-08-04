#!/usr/bin/env bash

## Run
rofi \
    -show drun \
    -theme ~/.config/rofi/launcher/style.rasi \
    -run-shell-command 'wezterm -e {cmd}'
