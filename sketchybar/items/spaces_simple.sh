#!/bin/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

# Spaces for Display 1 and Display 2
SPACES_DISPLAY_1=(1 2)
SPACES_DISPLAY_2=(3 4)

# Defaults
spaces=(
    updates=on
    icon.padding_left=4
    icon.padding_right=0
    ignore_association=on
    label.padding_right=4
    icon.color="$(getcolor grey 50)"
    label.color="$(getcolor grey 50)"
)
# Assign spaces to Display 1
for SID in "${SPACES_DISPLAY_1[@]}"; do
    sketchybar --add space "space.$SID" left \
        --set "space.$SID" "${spaces[@]}" \
        associated_display=1 \
        associated_space="$SID" \
        icon="$SID" \
        script="$PLUGIN_DIR/app_space_simple.sh $SID" \
        --subscribe space."$SID" mouse.clicked space_change update_yabai_icon space_windows_change
done

# Assign spaces to Display 2
for SID in "${SPACES_DISPLAY_2[@]}"; do
    sketchybar --add space space."$SID" left \
        --set space."$SID" "${spaces[@]}" \
        associated_display=2 \
        associated_space="$SID" \
        icon="$SID" \
        script="$PLUGIN_DIR/app_space_simple.sh $SID" \
        --subscribe space."$SID" mouse.clicked space_change update_yabai_icon space_windows_change
done

# Customize spaces for Display 1
sketchybar --set space.1 icon="$ICON_WEB" label="web" icon.highlight_color="$(getcolor blue)" label.highlight_color="$(getcolor blue)" \
    --set space.2 icon="$ICON_MISC" label="misc" icon.highlight_color="$(getcolor red)" label.highlight_color="$(getcolor red)" \
    --add event window_focus \
    --add event title_changed

# Customize spaces for Display 2
sketchybar --set space.3 icon="$ICON_NVIM" label="code" icon.highlight_color="$(getcolor orange)" label.highlight_color="$(getcolor orange)" \
    --set space.4 icon="$ICON_GHOST" label="ghost" icon.highlight_color="$(getcolor cyan)" label.highlight_color="$(getcolor cyan)"
