#!/bin/bash

# Arbitrary but unique message tag
msgTag="mybrightness"

# Adjust the brightness
brightnessctl set "$@" > /dev/null

# Get the brightness percentage using awk
brightness_percentage=$(brightnessctl | awk -F'[()]' '/Current brightness/ {print $2}' | tr -d '%')

# Show the brightness notification
dunstify -a "changeBrightness" -u low -i display-brightness -h string:x-dunst-stack-tag:$msgTag \
-h int:value:"$brightness_percentage" "🔆 Brightness: ${brightness_percentage}%"

# Play a brightness change sound
# paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &
