#!/usr/bin/env bash

# Locks the screen using hyprlock and switches kb layout to us.

pidof hyprlock || hyprlock &
hyprctl switchxkblayout all 0 >/dev/null 2>&1
