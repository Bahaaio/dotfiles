#!/usr/bin/env bash

LANGS="eng"

SELECTION=$(slurp 2>/dev/null)
[[ -z "$SELECTION" ]] && exit 1

grim -g "$SELECTION" - | tesseract -l "$LANGS" - - | wl-copy &&
  notify-send "Copied to clipboard" "$(wl-paste)"
