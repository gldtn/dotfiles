#!/usr/bin/env zsh

# Aerospace mode  settings
sketchybar --add item aerospace_mode center \
    --set aerospace_mode \
    label.drawing=on \
    icon.drawing=on \
    icon.padding_left=8 \
    icon.padding_right=6 \
    label.padding_left=6 \
    label.padding_right=8 \
    icon.color="$(getcolor red)" \
    label.color="$(getcolor grey 50)" \
    script="$CONFIG_DIR/plugins/aerospace_mode.sh"

# Add and subscribe to the aerospace_mode_change event
sketchybar --add event aerospace_mode_change \
    --subscribe aerospace_mode aerospace_mode_change
