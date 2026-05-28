#!/usr/bin/env bash

# Toggle hyprsunset and show an OSD message.

if [[ $(pgrep -x hyprsunset) ]]; then
  pkill -x hyprsunset
  swayosd-client --custom-message "Daylight Mode" --custom-icon weather-clear
else
  uwsm-app -- hyprsunset &
  swayosd-client --custom-message "Nightlight Mode" --custom-icon weather-clear-night
fi
