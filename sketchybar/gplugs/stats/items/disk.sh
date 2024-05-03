#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

disk=(
	background.padding_left=0
	background.padding_right=0
    label.background.color="$HIDDEN_LABEL_BG"
	label.font="$FONT:Heavy:12"
	label.color="$TEXT"
	icon="$DISK"
	icon.color="$MAROON"
    icon.padding_right=0
    icon.background.color=$HIDDEN_LABEL_BG
	update_freq=60
	script="$PLUGIN_DIR/stats/scripts/disk.sh"
)

sketchybar --add item disk right \
	--set disk "${disk[@]}"
