#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

memory=(
	background.padding_left=0
	background.padding_right=0
	label.font="$FONT:Heavy:12"
	label.color="$TEXT"
    label.background.color="$HIDDEN_LABEL_BG"
	icon="$MEMORY"
	icon.font="$FONT:Bold:16.0"
	icon.color="$GREEN"
    icon.padding_right=0
    icon.background.color=$HIDDEN_LABEL_BG
	update_freq=15
	script="$PLUGIN_DIR/stats/scripts/ram.sh"
)

sketchybar --add item memory right \
	--set memory "${memory[@]}"
