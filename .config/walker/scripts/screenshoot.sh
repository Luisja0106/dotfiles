#!/bin/bash

option_screen="All Screen\nActive Window\nSelected Area"
option_save="Copy to Clipboard\nSave"
walker_cmd="walker --dmenu -n -N -H --maxheight 200"
chosen_screen=$(echo -e $option_screen | $walker_cmd)
chosen_save=$(echo -e $option_save | $walker_cmd)

flag_screen=""
flag_save=""

case "$chosen_screen" in
    "All Screen")     flag_screen="-m output" ;;
    "Active Window")  flag_screen="-m window -m active" ;;
    "Selected Area")  flag_screen="-m region" ;;
esac

case "$chosen_save" in
    "Copy to Clipboard") flag_save="--clipboard-only" ;;
    "Save")              flag_save="" ;;
esac

hyprshot $flag_screen $flag_save
