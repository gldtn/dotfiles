#!/bin/bash

yabai=(
    icon="$YABAI_GRID"
    icon.color="$(getcolor grey)"
    label.drawing=off
    width=28
    script="$PLUGIN_DIR/yabai.sh"
    icon.font="$FONT:Bold:12.0"
    label.padding_right="$PADDINGS"
)

# Allows my shortcut / workflow in Alfred to trigger things in Sketchybar
sketchybar --add event update_yabai_icon

sketchybar --add item yabai right \
    --set yabai "${yabai[@]}" \
    --subscribe yabai space_change \
    mouse.scrolled.global \
    mouse.clicked \
    front_app_switched \
    space_windows_change \
    update_yabai_icon
