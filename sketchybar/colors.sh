#!/bin/bash

getcolor() {
    color_name=$1
    opacity=$2

    # Opacity values
    local o100=0xff
    local o95=0xf2
    local o85=0xd9
    local o75=0xbf
    local o50=0x80
    local o35=0x59
    local o25=0x40
    local o10=0x1a
    local o0=0x00

    #Cyberdream
    local bg=#16181a
    local fg=#ffffff
    local red=#ff6e5e
    local grey=#7b8496
    local pink=#ff5ea0
    local cyan=#5ef1ff
    local blue=#5ea1ff
    local bgAlt=#1e2124
    local white=#ffffff
    local green=#5eff6c
    local yellow=#f1ff5e
    local orange=#ffbd5e
    local purple=#bd5eff
    local magenta=#ff5ef1
    local bgHighlight=#3c4048

    case $opacity in
    0) local opacity=$o0 ;;
    10) local opacity=$o10 ;;
    35) local opacity=$o35 ;;
    25) local opacity=$o25 ;;
    50) local opacity=$o50 ;;
    75) local opacity=$o75 ;;
    85) local opacity=$o85 ;;
    95) local opacity=$o95 ;;
    *) local opacity=$o100 ;;
    esac

    case $color_name in
    bg) local color=$bg ;;
    fg) local color=$fg ;;
    red) local color=$red ;;
    pink) local color=$pink ;;
    grey) local color=$grey ;;
    blue) local color=$blue ;;
    cyan) local color=$cyan ;;
    white) local color=$white ;;
    green) local color=$green ;;
    bgAlt) local color=$bgAlt ;;
    yellow) local color=$yellow ;;
    orange) local color=$orange ;;
    purple) local color=$purple ;;
    magenta) local color=$magenta ;;
    bgHighlight) local color=$bgHighlight ;;
    *)
        echo "Invalid color name: $color_name" >&2
        return 1
        ;;
    esac

    echo $opacity"${color:1}"
}

# Declare and export variables
de() {
    local var_name=$1
    local value=$2
    eval "${var_name}='$value'"
    eval "export $var_name"
}

# Bar
de BAR_COLOR="$(getcolor bg 85)"
de BAR_BORDER_COLOR="$(getcolor bgAlt 0)"
# Backgrounds
de HIGHLIGHT="$(getcolor orange)"
de HIGHLIGHT_75="$(getcolor orange 75)"
de HIGHLIGHT_50="$(getcolor orange 50)"
de HIGHLIGHT_25="$(getcolor orange 25)"
de HIGHLIGHT_10="$(getcolor orange 10)"
# Icons
de ICON_COLOR="$(getcolor purple)"
de ICON_COLOR_INACTIVE="$(getcolor fg 50)"
# Labels
de LABEL_COLOR="$(getcolor fg 75)"
# Popups
de SHADOW_COLOR="$(getcolor bgAlt)"
de TRANSPARENT="$(getcolor bgAlt 0)"
de POPUP_BORDER_COLOR="$(getcolor bgAlt 0)"
de POPUP_BACKGROUND_COLOR="$(getcolor bgAlt 50)"
