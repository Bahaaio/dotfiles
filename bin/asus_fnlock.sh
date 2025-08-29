#!/usr/bin/env bash

# Script to set the permanent Asus Fn Lock default in /etc/modprobe.d/asus_wmi.conf
# Usage: asus_fn_default [0|1]
# 0 = media keys as default
# 1 = F1-F12 as default

set -e

VAL="$1"
CONF_FILE="/etc/modprobe.d/asus_wmi.conf"

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

if [[ "$VAL" == "0" ]]; then
    OUTVAL="N"
elif [[ "$VAL" == "1" ]]; then
    OUTVAL="Y"
else
    echo "Usage: $0 [0|1]"
    echo "  0 = media keys as default"
    echo "  1 = F1-F12 as default"
    exit 1
fi

LINE="options asus_wmi fnlock_default=$OUTVAL"

echo "$LINE" >"$CONF_FILE"
echo "Set Fn lock default to '$OUTVAL' in $CONF_FILE"
echo "Reboot for changes to take effect."
