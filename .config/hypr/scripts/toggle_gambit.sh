#!/bin/bash

#Setup
DIR=/run/user/$UID/variables
FILE="$DIR/gambit.activate"
mkdir -p "$DIR"

if [ -f "$FILE" ]; then
    rm "$FILE"
    hyprctl dispatch "hl.dsp.submap('reset')"
else
    touch "$FILE"
    hyprctl dispatch "hl.dsp.submap('gambit')"
fi

