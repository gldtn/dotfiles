#!/usr/bin/env sh
# My user configs

## Fonts
export FONT="SF Pro" # Needs to have Regular, Bold, Semibold, Heavy and Black variants
export NERD_FONT="Liga SFMono Nerd Font" # Liga SFMono Nerd Font
export FANCY_FONT="MonoLisa"
export PADDINGS=8
export BG_HEIGHT=21 # Items (Icons & Labels)

### Setting up default values
defaults=(
    drawing=on
    cache_scripts=off
    updates=when_shown
    icon.color=$ICON_COLOR
    icon.highlight_color=$ICON_HIGHLIGHT_COLOR
    icon.background.height=$BG_HEIGHT
    icon.font="$NERD_FONT:Bold:14.0"
    icon.padding_left=$PADDINGS
    icon.padding_right=$PADDINGS
    label.font="$FANCY_FONT:Bold:14.0"
	label.color=0xffeceff4
	label.highlight_color=0xff8CABC8
    label.background.color=0xff57627A
    label.background.height=$BG_HEIGHT
    label.background.corner_radius=0
    label.padding_left=$PADDINGS
    label.padding_right=$PADDINGS
    background.height=$BG_HEIGHT
    background.corner_radius=0
    background.border_width=0
    background.padding_left=8
    background.color=0xff57627A
    popup.background.border_width=2
    popup.background.corner_radius=9
    popup.background.border_color=$POPUP_BORDER_COLOR
    popup.background.color=$POPUP_BACKGROUND_COLOR
    popup.blur_radius=20
    popup.label.drawing=off
    popup.icon.drawing=off
    popup.background.shadow.drawing=on
)
