#!/usr/bin/env bash

# Check if elephant is running
if pgrep "waybar" > /dev/null
then
    # Send this diagnostic message to Standard Error (2>&1)
    echo ":: Killing waybar ::" 
    killall waybar
fi

waybar --config ~/.config/waybar/confs/panel/config.jsonc -s ~/.config/waybar/confs/panel/style.css &
