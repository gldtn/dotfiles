#!/bin/bash

# Find the PID
PID=$(pgrep -a AeroSpace)

# Kill it
if [ -n "$PID" ]; then
    terminal-notifier -title "AeroSpace Restart" -message "Killing AeroSpace process with PID: $PID"
    kill -9 "$PID"
    sleep 1
else
    terminal-notifier -title "AeroSpace Restart" -message "AeroSpace is not running."
fi

# Relaunch
open -a AeroSpace
terminal-notifier -title "AeroSpace Restart" -message "Restarted AeroSpace successfully."
