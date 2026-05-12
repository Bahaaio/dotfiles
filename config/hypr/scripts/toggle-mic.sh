#!/usr/bin/env bash

# Toggle the mic and the mic led

LED_PATH="/sys/class/leds/platform::micmute/brightness"

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
swayosd-client --input-volume mute-toggle

# toggle the mic led
if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q "MUTED"; then
  echo 1 >$LED_PATH
else
  echo 0 >$LED_PATH
fi
