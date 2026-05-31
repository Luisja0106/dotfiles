#!/bin/bash

#Setup
DIR=/run/user/$UID/variables
FILE="$DIR/gamemode.activate"
mkdir -p "$DIR"

if [ -f "$FILE" ]; then
    rm "$FILE"
    hyprctl eval "Disable_gamemode()"
else
    touch "$FILE"
    hyprctl eval "Activate_gamemode()"
fi

