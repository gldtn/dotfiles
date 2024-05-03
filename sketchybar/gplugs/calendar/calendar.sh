#!/bin/bash

# Calendar(Date & Time WIP)
calendar=(
    icon=$CALENDAR
    icon.background.color=$LABEL_BG # Match label color
    icon.padding_left=8
    icon.padding_right=0
    label.width=164
    update_freq=30
    script="$PLUGIN_DIR/calendar/events/calendar.sh"
    click_script="$PLUGIN_DIR/zen.sh"
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
