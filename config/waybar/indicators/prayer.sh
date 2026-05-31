#!/usr/bin/env bash

# prayer times for the next prayer and the calendar for the day

text=$(go-pray next | awk '{print $1 " " $3}')
tooltip=$(go-pray calendar | tail -n +2)

jq -cn \
  --arg text "$text" \
  --arg tooltip "$tooltip" \
  '{text: $text, tooltip: $tooltip}'
