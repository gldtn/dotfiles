#!/bin/bash

# Load global styles, colors, and icons
source "$CONFIG_DIR/globalstyles.sh"

# Defaults
spaces=(
    background.corner_radius=4
)

# Get all spaces
mapfile -t SPACES < <(yabai -m query --spaces index | jq -r '.[].index')

for SID in "${SPACES[@]}"; do
    # Add and set space in SketchyBar
    sketchybar --add space space."$SID" left \
        --set space."$SID" "${spaces[@]}" \
        script="$PLUGIN_DIR/app_space.sh $SID" \
        associated_space="$SID" \
        icon="$SID" \
        --subscribe space."$SID" mouse.clicked front_app_switched space_change window_focus window_created window_destroyed \
        --add event window_focus \
        --add event title_changed

    # Explicitly refresh Yabai to sync with SketchyBar when space is changed
    # yabai -m signal --add event=space_changed action="sketchybar --trigger space_change"
    # yabai -m signal --add event=window_focused action="sketchybar --trigger front_app_switched"
done

# Optional: force a redraw on SketchyBar after all spaces have been configured
sketchybar --trigger update_yabai_icon --trigger space_windows_change
