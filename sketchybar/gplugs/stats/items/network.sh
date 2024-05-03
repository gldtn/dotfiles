#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

N_ICON_PADDING=2

network_down=(
	#x_offset=-10
    background.padding_left=0
	background.padding_right=0
    label.color="$TEXT"
	label.font="$FONT:Heavy:10"
    label.background.color="$HIDDEN_LABEL_BG"
	icon="$NETWORK_DOWN"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.color="$GREEN"
    icon.padding_right=$N_ICON_PADDING
	icon.highlight_color="$BLUE"
    icon.background.color=$HIDDEN_LABEL_BG
	update_freq=1
)

network_up=(
	#background.padding_right=2
	#x_offset=-8
    background.padding_left=0
	background.padding_right=0
    label.color="$TEXT"
	label.font="$FONT:Heavy:10"
    label.background.color="$HIDDEN_LABEL_BG"
	icon="$NETWORK_UP"
	icon.font="$NERD_FONT:Bold:16.0"
	icon.color="$GREEN"
    icon.padding_right=$N_ICON_PADDING
	icon.highlight_color="$BLUE"
    icon.background.color=$HIDDEN_LABEL_BG
	update_freq=1
	script="$PLUGIN_DIR/stats/scripts/network.sh"
)

sketchybar 	--add item network.down right 					\
				--set network.down "${network_down[@]}" 	\
			--add item network.up right 					\
				--set network.up "${network_up[@]}"
