#!/bin/bash

RUN_VERIFICATION_FILE="$XDG_RUNTIME_DIR/vnc_running"
IP=" --output=HDMI-A-1 localhost"

if [ -f "$RUN_VERIFICATION_FILE" ]; then
    if killall wayvnc 2>/dev/null; then
        rm "$RUN_VERIFICATION_FILE"
        notify-send "VNC Disable" "The VNC Server has been disable" --urgency=normal
    else
        rm "$RUN_VERIFICATION_FILE"
        notify-send "VNC Is not Active" "VNC Was no active, Removing the verification file" --urgency=low
    fi
else
    wayvnc "$IP" &
    sleep 0.2
    if kill -0 $! 2>/dev/null; then
        touch "$RUN_VERIFICATION_FILE"
        notify-send "VNC Running" "The VNC server is running, please connect your device" --urgency=normal
    else
        notify-send "VNC Error" "The VNC couln't be initialize" --urgency=critical
        exit 1
    fi
fi
