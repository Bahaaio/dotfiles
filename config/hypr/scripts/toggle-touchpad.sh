#!/usr/bin/env bash

CONFIG_FILE="$HOME/.config/hypr/modules/touchpad.conf"

if grep -q 'enabled *= *true' "$CONFIG_FILE"; then
  sed -i 's/enabled *= *true/enabled = false/' "$CONFIG_FILE"
  MSG="Touchpad OFF"
else
  sed -i 's/enabled *= *false/enabled = true/' "$CONFIG_FILE"
  MSG="Touchpad ON"
fi

swayosd-client --custom-message "$MSG" --custom-icon input-touchpad
