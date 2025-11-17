#!/bin/bash

# Script to adjust system volume, show a notification, and play a sound.
# Requires: wpctl (PipeWire), dunstify, paplay (with freedesktop sound theme)
# Usage:
#   changeVolume.sh 5%+         # Increase volume by 5%
#   changeVolume.sh 5%-         # Decrease volume by 5%
#   changeVolume.sh toggleMute  # Toggle mute state

# Arbitrary but unique message tag
msgTag="myvolume"

# Get the current mute status from wpctl.
mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

# Change the volume using wpctl
if [[ "$1" == "toggleMute" || "$mute_status" == "[MUTED]" ]]; then
    # unmute if muted
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
else
    # else, use the provided args
    wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ "$@"
fi

# Query wpctl for the current volume and whether or not the speaker is muted
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')"
mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [[ $volume == 0 || "$mute_status" == "[MUTED]" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -h string:x-dunst-stack-tag:$msgTag "🔇 Volume muted"
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -h string:x-dunst-stack-tag:$msgTag \
        -h int:value:"$volume" "🔊  Volume: ${volume}%"
fi

# Play the volume changed sound
paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &
