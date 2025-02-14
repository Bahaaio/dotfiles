#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

## Run
rofi \
    -show drun \
    -theme ~/.config/rofi/launcher/style.rasi \
    -run-shell-command 'wezterm -e {cmd}'
