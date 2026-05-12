#!/usr/bin/env bash

# Take a screenshot of the whole screen, a specific window, or a user-drawn region.

MODE="${1:-smart}" # smart | full
OUTPUT_DIR="$HOME/Pictures/Screenshots"

FILENAME="screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"
FILEPATH="$OUTPUT_DIR/$FILENAME"
mkdir -p "$OUTPUT_DIR"

pkill slurp && exit 1

open_editor() {
  local filepath="$1"
  satty --filename "$filepath" \
    --output-filename "$filepath" \
    --actions-on-enter save-to-clipboard \
    --save-after-copy \
    --copy-command 'wl-copy'
}

notify() {
  (
    ACTION=$(notify-send "Screenshot saved" "Click to edit" -t 10000 -i "$FILEPATH" -A "default=edit")
    [[ $ACTION == "default" ]] && open_editor "$FILEPATH"
  ) &
}

if [[ "$MODE" == "full" ]]; then
  grim "$FILEPATH" || exit 1
  wl-copy <"$FILEPATH"
  notify
  exit 0
elif [[ "$MODE" != "smart" ]]; then
  echo "Invalid mode: $MODE. Use 'full' or 'smart'." && exit 1
fi

# accounting for portrait/transformed displays
JQ_MONITOR_GEO='
  def format_geo:
    .x as $x | .y as $y |
    (.width / .scale | floor) as $w |
    (.height / .scale | floor) as $h |
    .transform as $t |
    if $t == 1 or $t == 3 then
      "\($x),\($y) \($h)x\($w)"
    else
      "\($x),\($y) \($w)x\($h)"
    end;
'

get_rectangles() {
  local active_workspace=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')
  hyprctl monitors -j | jq -r --arg ws "$active_workspace" "${JQ_MONITOR_GEO} .[] | select(.activeWorkspace.id == (\$ws | tonumber)) | format_geo"
  hyprctl clients -j | jq -r --arg ws "$active_workspace" '.[] | select(.workspace.id == ($ws | tonumber)) | "\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"'
}

RECTS=$(get_rectangles)
hyprpicker -r -z >/dev/null 2>&1 &
PID=$!
sleep .1
SELECTION=$(echo "$RECTS" | slurp 2>/dev/null)
kill $PID 2>/dev/null

# If the selection area is L * W < 20, we'll assume you were trying to select whichever
# window or output it was inside of to prevent accidental 2px snapshots
if [[ $SELECTION =~ ^([0-9]+),([0-9]+)[[:space:]]([0-9]+)x([0-9]+)$ ]]; then
  if ((${BASH_REMATCH[3]} * ${BASH_REMATCH[4]} < 20)); then
    click_x="${BASH_REMATCH[1]}"
    click_y="${BASH_REMATCH[2]}"

    while IFS= read -r rect; do
      if [[ $rect =~ ^([0-9]+),([0-9]+)[[:space:]]([0-9]+)x([0-9]+) ]]; then
        rect_x="${BASH_REMATCH[1]}"
        rect_y="${BASH_REMATCH[2]}"
        rect_width="${BASH_REMATCH[3]}"
        rect_height="${BASH_REMATCH[4]}"

        if ((click_x >= rect_x && click_x < rect_x + rect_width && click_y >= rect_y && click_y < rect_y + rect_height)); then
          SELECTION="${rect_x},${rect_y} ${rect_width}x${rect_height}"
          break
        fi
      fi
    done <<<"$RECTS"
  fi
fi

# exit if no selection was made
[[ -z $SELECTION ]] && exit 0

grim -g "$SELECTION" "$FILEPATH" || exit 1
wl-copy <"$FILEPATH"
notify
