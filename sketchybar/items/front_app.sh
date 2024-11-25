#!/bin/bash

source "$HOME/.config/sketchybar/globalstyles.sh"
source "$HOME/.config/sketchybar/app_icons.sh"

FRONT_APP=(
    icon="􀆊"
    icon.color="$(getcolor blue)"
    icon.padding_left=8
    icon.padding_right=0
    icon.font="JetBrainsMono Nerd Font:Regular:14"
    label.color="$(getcolor fg 50)"
    script="$PLUGIN_DIR/front_app.sh"
)

# Create or update the front_app item
sketchybar --add item front_app left

# Configure the front_app item
sketchybar --set front_app "${FRONT_APP[@]}"

# Subscribe front_app to the front_app_switched event
sketchybar --subscribe front_app front_app_switched
