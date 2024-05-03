#!/bin/bash

source "$HOME/.config/sketchybar/icons_alt.sh"
source "$HOME/.config/sketchybar/colors_alt.sh"
export PLUGIN_DIR="$HOME/.config/sketchybar/gplugs"

# volume_slider=(
#     script="$PLUGIN_DIR/volume/volume.sh"
#     updates=on
#     label.drawing=off
#     icon.drawing=off
#     slider.highlight_color=$BLUE
#     slider.background.height=5
#     slider.background.corner_radius=3
#     slider.background.color=$BACKGROUND_2
#     slider.knob=􀀁
#     slider.knob.drawing=off
# )

volume_icon=(
    click_script="$PLUGIN_DIR/volume/events/volume_click.sh"
    padding_left=10
    icon=$VOLUME_100
    label.padding_left=0
    label.padding_right=0
)

# status_bracket=(
#   background.color=$BACKGROUND_1
#   background.border_color=$BACKGROUND_2
# )

sketchybar --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"

# sketchybar --add bracket status brew github.bell volume_icon \
#            --set status "${status_bracket[@]}"
