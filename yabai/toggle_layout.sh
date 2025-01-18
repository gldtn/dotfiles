#!/bin/bash

current_layout=$(yabai -m query --spaces --space | jq -r '.type')

if [ "$current_layout" = "bsp" ]; then
    yabai -m space --layout stack
else
    yabai -m space --layout bsp
fi
