#!/bin/bash

source "$HOME/.config/sketchybar/icons_alt.sh"
source "$HOME/.config/sketchybar/icons.sh"
export PLUGIN_DIR="$HOME/.config/sketchybar/gplugs"

PERCENTAGE=0

SPK_VOLUME=$(osascript -e "set volume output volume $PERCENTAGE")

if [[ $SPK_VOLUME -eq 0 ]]; then
  osascript -e 'set volume input volume 25'
  sketchybar -m --set volume icon=
elif [[ $SPK_VOLUME -gt 0 ]]; then
  osascript -e 'set volume input volume 0'
  sketchybar -m --set volume icon=
fi
