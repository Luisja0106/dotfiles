#!/bin/bash

#Setup
DIR=/run/user/$UID/variables
FILE="$DIR/qwerty.activate"
mkdir -p "$DIR"

if [ -f "$FILE" ]; then
    rm "$FILE"
    hyprctl reload
    hyprctl eval 'Send_notification("Return to Colemak-DH", 1000, 1, "#94e2d5")'
else
    touch "$FILE"
    hyprctl eval "Switch_to_qwerty()"
fi

