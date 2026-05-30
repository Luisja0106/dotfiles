#!/bin/bash

while inotifywait -e close_write ~/dotfilesLuffy/.config/waybar; do
  killall -SIGUSR2 waybar;
done
