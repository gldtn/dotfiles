#!/bin/bash

# Loads defined colors
source "$CONFIG_DIR/colors.sh"

IS_VPN=$(/usr/local/bin/piactl get connectionstate)
# CURRENT_WIFI and wired connection details
CURRENT_WIFI="$(ipconfig getsummary en0)"
WIRED_CONNECTION="$(ipconfig getsummary en0)" # Adjust this for your wired interface (e.g., en1)
WIRED_IP="$(echo "$WIRED_CONNECTION" | grep -o "yiaddr = .*" | sed 's/^yiaddr = //')"

# IP and SSID details
IP_ADDRESS="$(echo "$CURRENT_WIFI" | grep -o "yiaddr = .*" | sed 's/^yiaddr = //')"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID : .*" | sed 's/^SSID : //' | tail -n 1)"

if [[ -n "$WIRED_IP" && "$WIRED_IP" != "0.0.0.0" ]]; then
    ICON=
    COLOR="$ICON_COLOR"
    CONNECTION_TYPE="Ethernet"
    DISPLAY_IP="$WIRED_IP"
elif [[ $IS_VPN != "Disconnected" ]]; then
    ICON=􀎡
    COLOR=$HIGHLIGHT
elif [[ $SSID = "Ebrietas" ]]; then
    ICON=􀉤
    COLOR="$ICON_COLOR"
    CONNECTION_TYPE="Wi-Fi"
    DISPLAY_IP="$IP_ADDRESS"
elif [[ -n "$SSID" ]]; then
    ICON=􀐿
    COLOR="$ICON_COLOR"
    CONNECTION_TYPE="Wi-Fi"
    DISPLAY_IP="$IP_ADDRESS"
else
    ICON=􀐾
    COLOR="$(getcolor fg 25)"
    CONNECTION_TYPE="Not connected"
    DISPLAY_IP="No IP"
fi

render_bar_item() {
    sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR"
}

render_popup() {
    if [[ "$CONNECTION_TYPE" != "Not connected" ]]; then
        args=(
            --set wifi.ssid label="Connection: $CONNECTION_TYPE"
            --set wifi.ipaddress label="IP Address: $DISPLAY_IP"
            click_script="printf $DISPLAY_IP | pbcopy; sketchybar --set wifi popup.drawing=toggle"
        )
    else
        args=(
            --set wifi.ssid label="Not connected"
            --set wifi.ipaddress label="No IP"
        )
    fi

    sketchybar "${args[@]}" >/dev/null
}

update() {
    render_bar_item
    render_popup
}

popup() {
    sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
"routine" | "forced")
    update
    ;;
"mouse.clicked")
    popup toggle
    ;;
esac
