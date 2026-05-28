#!/usr/bin/env bash

LANGS="eng"

SELECTION=$(slurp 2>/dev/null)
[[ -z "$SELECTION" ]] && exit 1

TEXT=$(grim -g "$SELECTION" - | tesseract -l "$LANGS" - - 2>/dev/null)
[[ -z "$TEXT" ]] && exit 1

wl-copy "$TEXT"
notify-send "󰆏   Copied selection to clipboard"
