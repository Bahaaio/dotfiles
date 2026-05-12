#!/usr/bin/env bash

# Toggle nightlight temperature using hyprsunset and send a notification

ON_TEMP=4500
OFF_TEMP=6000
CURRENT_TEMP=$(hyprctl hyprsunset temperature)

if [[ "$CURRENT_TEMP" == "$OFF_TEMP" ]]; then
  hyprctl hyprsunset temperature $ON_TEMP
  swayosd-client --custom-message "Nightlight screen temperature" --custom-icon weather-clear-night
else
  hyprctl hyprsunset temperature $OFF_TEMP
  swayosd-client --custom-message "Daylight screen temperature" --custom-icon weather-clear
fi
