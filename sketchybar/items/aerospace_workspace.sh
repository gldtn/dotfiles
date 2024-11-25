#!/usr/bin/env zsh

# Define workspace names and icons for Display 1
typeset -A display_1_names=(
    [1]="Web"
    [2]="Music"
    [3]="Misc"
)
typeset -A display_1_icons=(
    [1]="􀤆 "
    [2]="􀫀 "
    [3]="􀑇 "
)

# Define workspace names and icons for Display 2
typeset -A display_2_names=(
    [4]="Code"
    [5]="Chat"
    [6]="Others"
)
typeset -A display_2_icons=(
    [4]="􀙚 "
    [5]="􀼂 "
    [6]="􀑇 "
)

# Add event for workspace change
sketchybar --add event aerospace_workspace_change

# Styling
spaces=(
    label.padding_left=6
    label.padding_right=6
    background.drawing=off
)

# Function to get superscript ordinal
get_superscript() {
    case "$1" in
    1) echo "¹" ;;
    2) echo "²" ;;
    3) echo "³" ;;
    4) echo "⁴" ;;
    5) echo "⁵" ;;
    6) echo "⁶" ;;
    *) echo "" ;;
    esac
}

# Add items for workspaces on Display 1
for sid in {1..3}; do
    superscript=$(get_superscript "$sid")
    sketchybar --add item space.$sid left \
        --set space.$sid \
        label="${display_1_names[$sid]}$superscript" \
        icon="${display_1_icons[$sid]}" \
        display=1 \
        "${spaces[@]}" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace_workspace.sh $sid" \
        --subscribe space.$sid aerospace_workspace_change
done

# Add items for workspaces on Display 2
for sid in {4..6}; do
    superscript=$(get_superscript "$sid")
    sketchybar --add item space.$sid left \
        --set space.$sid \
        label="${display_2_names[$sid]}$superscript" \
        icon="${display_2_icons[$sid]}" \
        display=2 \
        "${spaces[@]}" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace_workspace.sh $sid" \
        --subscribe space.$sid aerospace_workspace_change
done
