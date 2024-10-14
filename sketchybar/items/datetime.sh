#!/bin/env/bash

date=(
    update_freq=60
    label.padding_left=4
    label.padding_right=0
    label.font="$FONT:Semibold:12"
    click_script="open -a Calendar.app"
    script="sketchybar --set \$NAME label=\"\$(date \"+%a, %b %d\")\""
)

clock=(
    "${menu_defaults[@]}"
    icon=􀀁
    update_freq=10
    icon.font.size=6
    popup.align=right
    icon.padding_right=8
    label.padding_left=0
    label.font="$FONT:Bold:12"
    label.color="$LABEL_COLOR"
    script="$PLUGIN_DIR/nextevent.sh"
    icon.color="$(getcolor bgHighlight)"
    click_script="sketchybar --set clock popup.drawing=toggle; open -a Calendar.app"
)

calendar_popup=(
    icon.drawing=off
    label.max_chars=22
    label.padding_left=0
)

sketchybar \
    --add item clock right \
    --set clock "${clock[@]}" \
    --add item clock.next_event popup.clock \
    --set clock.next_event "${menu_item_defaults[@]}" "${calendar_popup[@]}" \
    --subscribe clock system_woke mouse.entered mouse.exited mouse.exited.global \
    \
    --add item date right \
    --set date "${date[@]}" \
    --add item date.details popup.date \
    --set date.details "${menu_item_defaults[@]}" \
    --subscribe date system_woke mouse.entered mouse.exited mouse.exited.global
