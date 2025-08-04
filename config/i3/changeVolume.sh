#!/bin/bash

# Arbitrary but unique message tag
msgTag="myvolume"

mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

# Change the volume using wpctl
if [[ "$1" == "toggleMute" || "$mute_status" == "[MUTED]" ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
else
     wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ "$@"
fi

# Query wpctl for the current volume and whether or not the speaker is muted
volume="$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')"
mute_status=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $3}')

if [[ $volume == 0 || "$mute_status" == "[MUTED]" ]]; then
    # Show the sound muted notification
    dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "🔇 Volume muted" 
else
    # Show the volume notification
    dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    -h int:value:"$volume" "🔊  Volume: ${volume}%"
fi

# Play the volume changed sound
paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &
