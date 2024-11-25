#!/usr/bin/env zsh

# Load global styles
source "$CONFIG_DIR/globalstyles.sh"

# Define colors
ACT_ICON_COLOR="$(getcolor orange)"
ACT_NAME_COLOR="$(getcolor white)"
INA_ICON_COLOR="$(getcolor fg 50)"
INA_NAME_COLOR="$(getcolor grey)"

# Get monitor IDs
DISPLAY_1=$(aerospace list-monitors --format '%{monitor-id}' | grep "1" | awk '{print $1}')
DISPLAY_2=$(aerospace list-monitors --format '%{monitor-id}' | grep "2" | awk '{print $1}')

# Get the visible workspace for each display
DISPLAY_1_FOCUSED_WORKSPACE=$(aerospace list-workspaces --monitor "$DISPLAY_1" --visible 2>/dev/null)
DISPLAY_2_FOCUSED_WORKSPACE=$(aerospace list-workspaces --monitor "$DISPLAY_2" --visible 2>/dev/null)

# Define workspace state and update the item
if [[ "$1" == "$DISPLAY_1_FOCUSED_WORKSPACE" || "$1" == "$DISPLAY_2_FOCUSED_WORKSPACE" ]]; then
    sketchybar --set "$NAME" \
        background.drawing=on \
        icon.color="$ACT_ICON_COLOR" \
        label.color="$ACT_NAME_COLOR"
else
    sketchybar --set "$NAME" \
        background.drawing=off \
        icon.color="$INA_ICON_COLOR" \
        label.color="$INA_NAME_COLOR"
fi
