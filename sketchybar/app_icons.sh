#!/bin/zsh

# Define app icons
typeset -A ICONS=(
    # Yabai Icons
    YABAI_GRID                  "􀧍"
    YABAI_FLOAT                 "􀢌"
    YABAI_STACK                 "􀏭"
    YABAI_PARENT_ZOOM           "􀥃"
    YABAI_SPLIT_VERTICAL        "􀘜"
    YABAI_FULLSCREEN_ZOOM       "􀂓"
    YABAI_SPLIT_HORIZONTAL      "􀧋"

    # General Icons
    CMD                         "󰘳"
    LOCK                        "󰌾"
    APP                         ""  # fallback app

    # Web Browsers
    WEB                         "󰇧"  # default browser
    SAFARI                      ""
    FIREFOX                     "󰈹"
    GOOGLE_CHROME               ""
    FIREFOX_DEVELOPER_EDITION   ""

    # Terminal Apps
    TERM                        "􀩼"  # default terminal
    KITTY                       "􀪏"
    GHOSTTY                     ""

    # Dev/Code Editors
    DEV                         ""  # default dev
    CODE                        ""
    SUBLIME_TEXT                ""

    # AI Apps
    AI                          ""  # default AI

    # Mail Apps
    MAIL                        "􀍖"  # default mail
    MIMESTREAM                  ""

    # Music Apps
    MUSIC                       ""  # default music
    SPOTIFY                     ""
    ITUNES                      ""

    # Chat Apps
    CHAT                        "􀼂"  # default chat
    STEAM                       "󰓓"
    SLACK                       ""
    TWITCH                      ""
    DISCORD                     ""
    WHATSAPP                    ""
    TELEGRAM                    ""

    # MacOS Apps
    TV                          "􀡴"
    COG                         "􀍟"  # system settings, system information, tinkertool
    SIRI                        "􂮢"
    MAPS                        ""
    NEWS                        "􀥅"
    HOME                        "􀠀"
    CLOCK                       "󰥔"
    BOOKS                       ""
    NOTES                       "󱞎"
    PAGES                       ""
    STOCKS                      "􀑁"
    FINDER                      "󰀶"
    PHOTOS                      ""
    PREVIEW                     "󰋲"
    WEATHER                     "󰖕"
    FIND_MY                     "󰍒"
    NUMBERS                     "󱕍"
    KEYNOTE                     "󰐩"
    FACETIME                    "􀱱"
    FREEFORM                    "􀤑"
    PODCASTS                    "󰦔"
    CONTACTS                    "󰛋"
    CALENDAR                    "􀉉"
    PASSWORDS                   "􀞚"
    REMINDERS                   "󱃔"
    APP_STORE                   ""
    FONT_BOOK                   ""
    DICTIONARY                  "󱁯"
    SF_SYMBOLS                  "􂮱"
    CALCULATOR                  ""
    VOICE_MEMOS                 "󰍬"
    PHOTO_BOOTH                 "󰄀"
    DISK_UTILITY                "􀯰"
    KEYCHAIN_ACCESS             "󱕴"
    IMAGE_PLAYGROUND            "􂮖"
    ACTIVITY_MONITOR            "󰺓"

    # Design Apps
    SKETCH                      ""
    PHOTOSHOP                   ""
    AFTEREFFECTS                "󱁑"
    INDESIGN                    "󰴑"
    ILLUSTRATOR                 ""
    FIGMA                       ""

    # Other Apps
    GLM                         "󰓃"
    VPN                         "󰦝"  # vpn, nordvpn
    GIT                         "󰊢"  # lazygit
    LIST                        "󱃔"  # taskwarrior, taskwarrior-tui, reminders, onenote
    PLAY                        "󱉺"  # tv, quicktime, vlc
    CAST                        "󱒃"  # airflow
    TABLE                       "󰓫"  # excel
    KICAD                       ""
    CLOUD                       "󰅧"  # onedrive
    POPCORN                     "􁐈"
    PACKAGE                     "󰏓"  # brew
    RUSTDESK                    "󰞯"
    DOWNLOAD                    "󱑢"  # progressive downloader, transmission
    DAISYDISK                   "󰞯"
    VIDEOCHAT                   "󰍫"  # facetime, zoom, webex
    SCREENSAVOR                 "󱄄"  # unimatrix, pipe.sh
    CLEANSHOT_X                 "􀎼"
    REMOTEDESKTOP               "󰢹"  # vmware, utm
    DOWNLOAD_JDOWNLOADER        "􁾮"  # Jdownloader2
)

# Export all icons as environment variables
for key value in ${(kv)ICONS}; do
    export ICON_${key}="${value}"
done
