#!/bin/bash

FRONT_APP=(
    icon=􀆊
    icon.color="$(getcolor fg 50)"
    label.color="$(getcolor fg 50)"
    script="$PLUGIN_DIR/front_app.sh"
)

# icon=􀆊
# icon_color="$(getcolor fg 50)"
# front_app_script="$PLUGIN_DIR/front_app.sh"

sketchybar \
    --add item front_app left \
    --set front_app "${FRONT_APP[@]}" \
    --subscribe front_app front_app_switched
# space_change space_windows_change
# --set front_app script="$front_app_script" icon="$icon" label.padding_right=0 icon.color="$icon_color"
