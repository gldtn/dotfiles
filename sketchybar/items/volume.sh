#!/bin/bash

volume_slider=(
    updates=on
    padding_left=0
    padding_right=0
    icon.drawing=off
    label.drawing=off
    slider.background.height=8
    script="$PLUGIN_DIR/volume.sh"
    slider.background.corner_radius=12
    slider.highlight_color="$HIGHLIGHT"
    slider.background.color="$(getcolor fg 25)"
)

volume_icon=(
    label.drawing=off
    icon="$VOLUME_100"
    click_script="$PLUGIN_DIR/volume_click.sh"
)

sketchybar --add slider volume right \
    --set volume "${volume_slider[@]}" \
    --subscribe volume volume_change \
    mouse.clicked \
    mouse.entered \
    mouse.exited \
    mouse.exited.global \
    \
    --add item volume_icon right \
    --set volume_icon "${volume_icon[@]}"
