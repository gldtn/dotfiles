#!/bin/bash

# shellcheck disable=SC1091
source "$CONFIG_DIR/globalstyles.sh" # Load global styles, colors, and icons

# Source weather data script to fetch the latest values
source "$PLUGIN_DIR/weather.sh"

# Weather Item Configuration (shows icon and temperature in the main item)
weather=(
    "${menu_defaults[@]}"
    icon="$ICON"
    icon.padding_right=0
    label="$TEMP$DEGREE"
    icon.color="$HIGHLIGHT"
    label.padding_right=4
    icon.font.size=12
    popup.align=left
    script="$PLUGIN_DIR/weather.sh"
)

# Weather Popup Items Configuration (for the popup)
weather_current_label=(
    "${menu_item_defaults[@]}"
    icon="Current Weather"
    label=""
    "${separator[@]}"
)

weather_current_temp=(
    "${menu_item_defaults[@]}"
    icon="$ICON"
    label="$CONDITION_TEXT, $TEMP$DEGREE"
)

weather_feels_like=(
    "${menu_item_defaults[@]}"
    icon=""
    label="Feels like $FEELSLIKE$DEGREE"
)

weather_humidity=(
    icon=""
    "${menu_item_defaults[@]}"
    label="Humidity: $HUMIDITY%"
)

weather_location=(
    "${menu_item_defaults[@]}"
    icon=""
    label="Location: $LOCATION"
)

weather_spacer=(
    "${menu_item_defaults[@]}"
    label=""
)

# Weather Popup Configuration (including 5-day forecast)
weather_forecast_label=(
    "${menu_item_defaults[@]}"
    icon="5-Day Forecast"
    label=""
    "${separator[@]}"
)

# Add the weather item and set its properties
sketchybar \
    --add item weather right \
    --set weather "${weather[@]}" \
    --subscribe weather mouse.entered mouse.exited mouse.exited.global mouse.clicked \
    --add item weather.current_label popup.weather \
    --set weather.current_label "${weather_current_label[@]}" \
    --add item weather.current_temp popup.weather \
    --set weather.current_temp "${weather_current_temp[@]}" \
    --add item weather.feels_like popup.weather \
    --set weather.feels_like "${weather_feels_like[@]}" \
    --add item weather.humidity popup.weather \
    --set weather.humidity "${weather_humidity[@]}" \
    --add item weather.location popup.weather \
    --set weather.location "${weather_location[@]}" \
    --add item weather.spacer popup.weather \
    --set weather.spacer "${weather_spacer[@]}" \
    --add item weather.forecast_label popup.weather \
    --set weather.forecast_label "${weather_forecast_label[@]}"

# Iterate through the forecast days and add each with icon and label
for i in $(seq 0 4); do
    ICON="${FORECAST_ICONS[$i]}"     # Set the icon for each forecast day
    FORECAST_LABEL="${FORECAST[$i]}" # Get the label for each forecast day

    sketchybar --add item weather.forecast_day_"$i" popup.weather \
        --set weather.forecast_day_"$i" \
        icon="$ICON" \
        label="$FORECAST_LABEL" \
        icon.padding_right=5 \
        "${menu_item_defaults[@]}"
done
