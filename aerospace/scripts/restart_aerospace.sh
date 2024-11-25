#!/bin/bash

# Find the PID of AeroSpace
PID=$(pgrep -a AeroSpace)

# If the process exists, kill it
if [ -n "$PID" ]; then
    terminal-notifier -title "AeroSpace Restart" -message "Killing AeroSpace process with PID: $PID"
    kill -9 "$PID"
    sleep 1 # Allow some time for the process to terminate
else
    terminal-notifier -title "AeroSpace Restart" -message "AeroSpace is not running."
fi

# Relaunch AeroSpace
open -a AeroSpace
terminal-notifier -title "AeroSpace Restart" -message "Restarted AeroSpace successfully."
