#!/bin/zsh

# Get the list of windows once
WIN_LIST=$(wmctrl -x -l)

# Convert the active window ID to hexadecimal
ACTIVE_WIN_ID=$(xdotool getactivewindow)
ACTIVE_WIN_ID_HEX=$(printf "0x%08x\n" "$ACTIVE_WIN_ID")

case "$1" in
    F1)
        # Check if WezTerm is open and get its window ID
        WEZTERM_WIN=$(echo "$WIN_LIST" | grep -F "org.wezfurlong.wezterm" | awk '{print $1}')
        
        if [[ -n "$WEZTERM_WIN" ]]; then
            # Compare the active window ID (in hexadecimal) with WezTerm window ID
            if [[ "$ACTIVE_WIN_ID_HEX" == "$WEZTERM_WIN" ]]; then
                # Minimize WezTerm
                xdotool windowminimize "$WEZTERM_WIN"
            else
                # Focus WezTerm
                wmctrl -x -a "org.wezfurlong.wezterm"
            fi
        else
            # Launch WezTerm if not open
            wezterm &
        fi
        ;;
    F2)
        # Check if Brave is open and get its window ID
        BRAVE_WIN=$(echo "$WIN_LIST" | grep -F "brave-browser" | awk '{print $1}')
        
        if [[ -n "$BRAVE_WIN" ]]; then
            # Compare the active window ID (in hexadecimal) with Brave window ID
            if [[ "$ACTIVE_WIN_ID_HEX" == "$BRAVE_WIN" ]]; then
                # Minimize Brave
                xdotool windowminimize "$BRAVE_WIN"
            else
                # Focus Brave
                wmctrl -x -a "Brave-browser"
            fi
        else
            # Launch Brave if not open
            brave-browser &
        fi
        ;;
    *)
        echo "No program configured for $1"
        ;;
esac

