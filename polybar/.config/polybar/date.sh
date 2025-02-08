#!/bin/bash

# Get the current day name, day of the month, and time
day_name=$(date +%a)
day=$(date +%e)
time=$(date +%I:%M\ %p)

# Function to add ordinal suffix to the day
get_ordinal() {
    if [[ "$1" == "11" || "$1" == "12" || "$1" == "13" ]]; then
        echo "${1}th"
    else
        case "${1: -1}" in
            1) echo "${1}st" ;;
            2) echo "${1}nd" ;;
            3) echo "${1}rd" ;;
            *) echo "${1}th" ;;
        esac
    fi
}

# Get the day with the ordinal suffix
day_with_ordinal=$(get_ordinal "$day")

# Add a space after the day name if the day is greater than 9
if [[ "$day" -gt 9 ]]; then
    day_name="$day_name "
fi

echo " $day_name$day_with_ordinal | $time"

