#!/bin/bash

WINDOW_RESIZE_AMOUNT=30

if [[ $1 = "-j" ]]; then
    SPLIT_CHILD=$(yabai -m query --windows --window | jq '.["split-child"]')

    if [[ $SPLIT_CHILD == "\"first_child\"" ]]; then
        yabai -m window --resize bottom:0:$WINDOW_RESIZE_AMOUNT
    fi

    if [[ $SPLIT_CHILD == "\"second_child\"" ]]; then
        yabai -m window --resize top:0:$WINDOW_RESIZE_AMOUNT
    fi
elif [[ $1 = "-k" ]]; then
    SPLIT_CHILD=$(yabai -m query --windows --window | jq '.["split-child"]')

    if [[ $SPLIT_CHILD == "\"first_child\"" ]]; then
        yabai -m window --resize bottom:0:-$WINDOW_RESIZE_AMOUNT
    fi

    if [[ $SPLIT_CHILD == "\"second_child\"" ]]; then
        yabai -m window --resize top:0:-$WINDOW_RESIZE_AMOUNT
    fi
elif [[ $1 = "-h" ]]; then
    yabai -m window `yabai -m query --spaces --space | jq '."first-window"'` --resize right:-$WINDOW_RESIZE_AMOUNT:0
elif [[ $1 = "-l" ]]; then
    yabai -m window `yabai -m query --spaces --space | jq '."first-window"'` --resize right:$WINDOW_RESIZE_AMOUNT:0
else
    echo "Invalid flag entered."
fi