#!/bin/bash

# Load defined icons
source "$CONFIG_DIR/icons.sh"

# Load defined colors
source "$CONFIG_DIR/colors.sh"

PADDINGS=8
FONT="JetBrainsMono Nerd Font"

# Bar Appearance
export bar=(
    sticky=on
    height=33
    topmost=off
    position=top
    blur_radius=0
    corner_radius=0
    notch_width=160
    color="$BAR_COLOR"
    padding_left="$PADDINGS"
    padding_right="$PADDINGS"
)

# Item Defaults
export item_defaults=(
    scroll_texts=on
    updates=when_shown
    # Icon
    icon.padding_left=2
    icon.color="$ICON_COLOR"
    icon.font="$FONT:Regular:12"
    icon.background.corner_radius=4
    icon.highlight_color="$HIGHLIGHT"
    icon.padding_right="$((PADDINGS / 2))"
    # Label
    label.color="$LABEL_COLOR"
    label.font="$FONT:Regular:12"
    label.highlight_color="$HIGHLIGHT"
    label.padding_left="$((PADDINGS / 1))"
    # Background
    background.padding_left=$((PADDINGS / 2))
    background.padding_right="$((PADDINGS / 2))"
)

export icon_defaults=(
    label.drawing=off
)

export notification_defaults=(
    # Settings
    updates=on
    drawing=off
    update_freq=120
    # Icon
    icon.font.size=10
    icon.padding_right=0
    icon.padding_left="$PADDINGS"
    # Background
    background.height=20
    background.corner_radius=16
    background.color="$(getcolor fg 25)"
    # Label
    label.font.size=11
    label.font.style=Bold
    label.padding_right="$PADDINGS"
    icon.color="$(getcolor bgHighlight 75)"
    label.color="$(getcolor bgHighlight 75)"
)

export bracket_defaults=(
    background.height=20
    background.corner_radius=4
    background.color="$(getcolor bgHighlight 35)"
)

export menu_defaults=(
    popup.blur_radius=32
    popup.background.shadow.angle=90
    popup.background.shadow.drawing=on
    popup.background.shadow.distance=16
    popup.background.corner_radius="$PADDINGS"
    popup.background.color="$POPUP_BACKGROUND_COLOR"
    popup.background.shadow.color="$(getcolor bgHighlight 50)"
)

export menu_item_defaults=(
    label.font="$FONT:Regular:12"
    padding_left="$PADDINGS"
    padding_right="$PADDINGS"
    icon.padding_left=0
    icon.color="$HIGHLIGHT"
    background.color="$TRANSPARENT"
    scroll_texts=on
)

export separator=(
    width=180
    background.height=1
    background.y_offset=-16
    background.color="$(getcolor fg 25)"
)
