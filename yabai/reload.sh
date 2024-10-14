#!/bin/bash

SID=$(yabai -m query --spaces index --space | jq -r '.index')
source ~/.config/yabai/yabairc
yabai -m space --focus $SID
