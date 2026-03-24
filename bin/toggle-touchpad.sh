#!/usr/bin/bash

# script to toggle the touchpad on/off and set preferred properties when enabled.
# Requires: xinput, dunstify

# id=$(xinput list | grep -Poi 'Touchpad.*id=\K\d+')
msgTag="touchpad"
device='ASUE1211:00 04F3:3211 Touchpad'
enabled=$(xinput list-props "$device" | awk '/Device Enabled/ {print $NF}')

if [ "$enabled" -eq 1 ]; then
  xinput set-prop "$device" "Device Enabled" 0
  dunstify "󰍾  Touchpad Disabled" -h string:x-dunst-stack-tag:$msgTag
else
  xinput set-prop "$device" "Device Enabled" 1
  xinput set-prop "$device" "libinput Tapping Enabled" 1
  xinput set-prop "$device" "libinput Natural Scrolling Enabled" 1
  dunstify "󰍽  Touchpad Enabled" -h string:x-dunst-stack-tag:$msgTag
fi
