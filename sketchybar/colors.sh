#!/usr/bin/env bash

#
#
# Catppuccin Macchiato palette
#
#

export BASE=0xff24273a
export MANTLE=0xff1e2030
export CRUST=0xff181926

export TEXT=0xffcad3f5
export SUBTEXT0=0xffb8c0e0
export SUBTEXT1=0xffa5adcb

export SURFACE0=0xff363a4f
export SURFACE1=0xff494d64
export SURFACE2=0xff5b6078

export OVERLAY0=0xff6e738d
export OVERLAY1=0xff8087a2
export OVERLAY2=0xff939ab7

export BLUE=0xff8aadf4
export LAVENDER=0xffb7bdf8
export SAPPHIRE=0xff7dc4e4
export SKY=0xff91d7e3
export TEAL=0xff8bd5ca
export GREEN=0xffa6da95
export YELLOW=0xffeed49f
export PEACH=0xfff5a97f
export MAROON=0xffee99a0
export RED=0xffed8796
export MAUVE=0xffc6a0f6
export PINK=0xfff5bde6
export FLAMINGO=0xfff0c6c6
export ROSEWATER=0xfff4dbd6

# SPOTIFY
export WHITE=0xffcad3f5
export BLACK=0xff181926
export POPUP_BACKGROUND_COLOR=$BASE
export POPUP_BORDER_COLOR=$WHITE


export RANDOM_CAT_COLOR=("$BLUE" "$LAVENDER" "$SAPPHIRE" "$SKY" "$TEAL" "$GREEN" "$YELLOW" "$PEACH" "$MAROON" "$RED" "$MAUVE" "$PINK" "$FLAMINGO" "$ROSEWATER")

function getRandomCatColor() {
  echo "${RANDOM_CAT_COLOR[ $RANDOM % ${#RANDOM_CAT_COLOR[@]} ]}"
}

#
# LEGACY COLORS
#
# Color Palette
export GREY=0xff939ab7
export TRANSPARENT=0x00000000

# General bar colors
export TEXT=0xffCAD3F5
export BAR_COLOR=0xff3b4252
export ICON_COLOR=$TEXT # Color of all icons
export LABEL_COLOR=$TEXT # Color of all labels
export LABEL_BG=0xff57627A # Label background color
export HIDDEN_LABEL_BG=$BAR_COLOR # Hidden label background
export SPOTIFY_GREEN=0xff1ED761
export ICON_HIGHLIGHT_COLOR=0xff8CABC8
