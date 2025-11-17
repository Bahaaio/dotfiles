#!/bin/bash

# Script to adjust screen brightness, show a notification, and play a sound.
# Requires: brightnessctl, dunstify, and paplay with freedesktop sound theme
# Usage: changeBrightness.sh [brightnessctl arguments]
# Example: changeBrightness.sh 10%+   # increases brightness by 10%

# Arbitrary but unique message tag
msgTag="mybrightness"

# Adjust the brightness
brightnessctl set "$@" >/dev/null

# Get the brightness percentage using awk
brightness_percentage=$(brightnessctl | awk -F'[()]' '/Current brightness/ {print $2}' | tr -d '%')

# Show the brightness notification
dunstify -a "changeBrightness" -u low -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$brightness_percentage" "🔆 Brightness: ${brightness_percentage}%"
