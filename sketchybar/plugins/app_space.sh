#!/bin/bash

# Load global styles, colors and icons
source "$CONFIG_DIR/globalstyles.sh"

SID=$1
DEBUG=1

create_icons() {
    sketchybar --set space."$1" label="$(create_label "$1")"
}

update_icons() {
    # Get the currently active space index
    CURRENT_SID=$(yabai -m query --spaces --space | jq -r '.index')

    # Check if the current space is active
    if [[ "$CURRENT_SID" == "$SID" ]]; then
        # This is the active space, apply the active styles
        create_icons "$CURRENT_SID"
        BACKGROUND_COLOR=$HIGHLIGHT
        COLOR=$BAR_COLOR
        STYLE="Bold"
    else
        # Reset to default styles(inactive space)
        create_icons "$SID"
        STYLE="Regular"
        COLOR=$LABEL_COLOR
        BACKGROUND_COLOR="$(getcolor fg 1)"
    fi

    # Update SketchyBar to reflect the new styles for both active and inactive spaces
    sketchybar --animate tanh 10 \
        --set space."$SID" icon.color="$COLOR" \
        label.color="$COLOR" \
        background.height=18 \
        label.font.style="$STYLE" \
        icon.padding_left="$PADDINGS" \
        background.color="$BACKGROUND_COLOR"
}

create_label() {
    SID=$1
    QUERY=$(yabai -m query --windows app,has-focus --space "$SID")
    IFS=$'\n'

    # Use mapfile to safely read the output into the APPS array
    local APPS
    mapfile -t APPS < <(echo "$QUERY" | jq -r '.[].app' | sort -u)

    # Get the currently focused app
    local CURRENT_APP
    CURRENT_APP=$(echo "$QUERY" | jq -r '.[] | select(.["has-focus"] == true) | .app')

    local LABEL BADGE

    # if [[ $APPS ]]; then
    #   export PADDING_LABEL=$PADDINGS
    for APP in "${APPS[@]}"; do
        # Add icon
        LABEL+=$("$HOME/.config/sketchybar/plugins/app_icon.sh" "$APP")
        # Set up badge
        BADGE="$(set_badge "$APP")"
        # Add app name for currently focused app
        if [[ "$APP" == "$CURRENT_APP" ]]; then
            LABEL+=" $APP"
        # For unfocused apps…
        else
            # Add a space if there is a badge
            if [[ $BADGE ]]; then
                LABEL+=" "
            fi
        fi
        # Add badge
        LABEL+="$BADGE"
        # Add a space between labels if there is more than one app on a space
        if ((${#APPS[@]} > 1)); then
            LABEL+=" "
        fi
    done
    # Remove trailing space if necessary
    if [[ "$LABEL" =~ [[:space:]]$ ]]; then
        LABEL="${LABEL%"${LABEL##*[![:space:]]}"}"
    fi
    echo "$LABEL"
    unset IFS
}

set_badge() {
    if [[ "$1" == "Messages" ]]; then
        BADGE=$(sqlite3 ~/Library/Messages/chat.db "SELECT COUNT(guid) FROM message WHERE NOT(is_read) AND NOT(is_from_me) AND text !=''")
    else
        BADGE=$(lsappinfo -all info -only StatusLabel "$APP" | sed -nr 's/\"StatusLabel\"=\{ \"label\"=\"(.+)\" \}$/\1/p')
    fi

    if [[ ! "$BADGE" ]]; then
        echo ""
    elif [[ ! "$BADGE" =~ ^[0-9]+$ ]]; then
        echo "􀍡"
    elif (($BADGE < 10)); then
        ICONS=("" 􀀺 􀀼 􀀾 􀁀 􀁂 􀁄 􀁆 􀁈 􀁊)
        echo "${ICONS[$BADGE]}"
    else
        echo "􀍡"
    fi
}

mouse_clicked() {
    if [[ "$BUTTON" == "right" ]] || [[ "$MODIFIER" == "shift" ]]; then
        SPACE_NAME="${NAME#*.}"
        SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Rename space $SPACE_NAME to:\" default answer \"\" with title \"Space Renamer\" buttons {\"Cancel\", \"Rename\"} default button \"Rename\"))")"
        if [[ $? -eq 0 ]]; then
            if [[ "$SPACE_LABEL" == "" ]]; then
                set_space_label "${NAME:5}"
            else
                set_space_label "${NAME:5} $SPACE_LABEL"
            fi
        fi
    elif [[ "$MODIFIER" == "cmd" ]]; then
        ~/.config/yabai/cycle_windows.sh
    else
        yabai -m space --focus "$SID"
    fi
}

set_space_label() {
    sketchybar --set "$NAME" icon="$*"
}

debug() {
    if ((DEBUG == 1)); then
        echo ---"$(date +"%T")"---
        echo sender: "$SENDER"
        echo sid: "$SID"
        echo ---
        echo "$@"
        echo ---
    fi
}

case "$SENDER" in
"routine" | "forced" | "space_windows_change")
    create_icons "$SID"
    update_icons
    ;;
"front_app_switched" | "space_change")
    update_icons
    ;;
"mouse.clicked")
    mouse_clicked
    ;;
esac