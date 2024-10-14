#!/bin/bash

# Load global styles, colors, and icons
source "$CONFIG_DIR/globalstyles.sh"

# Map OpenWeatherMap icon codes to Nerd Font icons
map_icon() {
    case $1 in
    01d) echo "" ;;       # Clear sky day
    01n) echo "" ;;       # Clear sky night
    02d) echo "" ;;       # Few clouds day
    02n) echo "" ;;       # Few clouds night
    03d | 03n) echo "" ;; # Scattered clouds
    04d | 04n) echo "" ;; # Broken clouds
    09d | 09n) echo "" ;; # Shower rain
    10d) echo "" ;;       # Rain day
    10n) echo "" ;;       # Rain night
    11d | 11n) echo "" ;; # Thunderstorm
    13d | 13n) echo "" ;; # Snow
    50d | 50n) echo "" ;; # Mist
    *) echo "􀌑" ;;         # Default icon for unknown cases
    esac
}

# Fetch current weather data and 5-day forecast from OpenWeatherMap
CITY="Attleboro"
COUNTRY="US"
API_KEY="a0cbbf05819f2ac763bbd4ddcd51c204"
UNITS="imperial"
DEGREE="°F"

# Fetch current weather data
DATA=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=$CITY,$COUNTRY&appid=$API_KEY&units=$UNITS")

# Fetch 5-day forecast data
FORECAST_DATA=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?q=$CITY,$COUNTRY&appid=$API_KEY&units=$UNITS")

# Extract current weather data
TEMP=$(echo "$DATA" | jq -r '.main.temp | floor')
FEELSLIKE=$(echo "$DATA" | jq -r '.main.feels_like | floor')
CONDITION_TEXT=$(echo "$DATA" | jq -r '.weather[0].main')
HUMIDITY=$(echo "$DATA" | jq -r '.main.humidity')
LOCATION=$(echo "$DATA" | jq -r '.name')
ICON_CODE=$(echo "$DATA" | jq -r '.weather[0].icon')

# Get the current icon for the weather item
ICON=$(map_icon "$ICON_CODE")

# Declare arrays for the forecast
declare -a FORECAST=()
declare -a FORECAST_ICONS=()

# Extract 5-day forecast data (every 8th entry is roughly one day apart)
for i in $(seq 0 4); do
    # Get the date for each forecast entry
    DATE=$(echo "$FORECAST_DATA" | jq -r ".list[$((i * 8))].dt_txt | .[0:10]")

    # Convert date (YYYY-MM-DD) to day of the week (MON, TUE, etc.)
    DAY=$(date -jf "%Y-%m-%d" "$DATE" +"%a")

    # Get forecast details
    DAY_CONDITION=$(echo "$FORECAST_DATA" | jq -r ".list[$((i * 8))].weather[0].main")
    DAY_TEMP=$(echo "$FORECAST_DATA" | jq -r ".list[$((i * 8))].main.temp | floor") # Extract temperature correctly
    ICON_CODE=$(echo "$FORECAST_DATA" | jq -r ".list[$((i * 8))].weather[0].icon")
    ICON=$(map_icon "$ICON_CODE")

    # Store the icon and forecast label for each day
    FORECAST_ICONS+=("$ICON")
    FORECAST+=("$DAY: ${DAY_TEMP}°F $DAY_CONDITION")
done

# Debugging final arrays
echo "FORECAST: ${FORECAST[*]}"
echo "FORECAST_ICONS: ${FORECAST_ICONS[*]}"

# Export both FORECAST and FORECAST_ICONS for use in the items script
export TEMP FEELSLIKE CONDITION_TEXT HUMIDITY LOCATION ICON DEGREE FORECAST FORECAST_ICONS

# Handle popup events
popup() {
    sketchybar --set "$NAME" popup.drawing="$1"
}

case "$SENDER" in
"mouse.entered")
    popup on
    ;;
"mouse.exited" | "mouse.exited.global")
    popup off
    ;;
"mouse.clicked")
    popup toggle
    ;;
esac
