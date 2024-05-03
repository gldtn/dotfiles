#!/usr/bin/env bash

separator_right=(
	icon=
	icon.font="$NERD_FONT:Regular:16.0"
	background.padding_left=0
	background.padding_right=0
	label.drawing=off
    icon.background.color=$HIDDEN_LABEL_BG
	click_script='sketchybar --trigger toggle_stats'
	icon.color="$TEXT"
)

sketchybar --add item separator_right right \
	--set separator_right "${separator_right[@]}"
