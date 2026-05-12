#!/usr/bin/env bash

LANGS="eng+ara"

grim -g "$(slurp)" - | tesseract -l "$LANGS" - - | wl-copy &&
  notify-send "Copied to clipboard" "$(wl-paste)"
