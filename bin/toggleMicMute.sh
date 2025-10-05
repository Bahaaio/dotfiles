#!/bin/bash

# Script to toggle microphone mute
# Specifc to Asus laptops
# Requires: wpctl

LED_PATH="/sys/class/leds/platform::micmute/brightness"

# toggle microphone mute
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# check volume status and update LED
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
    echo 1 >$LED_PATH
else
    echo 0 >$LED_PATH
fi
