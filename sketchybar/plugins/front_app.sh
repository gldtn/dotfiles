#!/bin/zsh

source "$HOME/.config/sketchybar/app_icons.sh"

if [ "$SENDER" = "front_app_switched" ]; then
    # Define app groups
    BROWSER_APPS=(
        "arc"
        "duckduckgo"
        "microsoft edge"
    )

    MAIL_APPS=(
        "mail"
        "spark"
        "airmail"
        "outlook"
        "thunderbird"
    )

    TERMINAL_APPS=(
        "iterm"
        "terminal"
        "wezterm"
        "alacritty"
    )

    DEV_APPS=(
        "zed"
        "vim"
        "emacs"
        "xcode"
        "neovim"
        "pycharm"
        "phpstorm"
        "webstorm"
        "intellij"
        "zed preview"
        "sublime text"
    )

    AI_APPS=(
        "chatgpt"
        "openai"
    )

    CHAT_APPS=(
        "messages"
    )

    MUSIC_APPS=(
        "itunes"
    )

    SETTINGS_APPS=(
        "settings"
        "system settings"
        "system information"
        "system preferences"
        "user notification center"
    )

    # Normalize INFO to lowercase
    NORMALIZED_INFO=$(echo "$INFO" | tr '[:upper:]' '[:lower:]')

    # Perform dynamic lookup for specific app icons (environment variables are uppercase)
    ICON_VAR="ICON_$(echo "$NORMALIZED_INFO" | tr ' ' '_' | tr '[:lower:]' '[:upper:]')"
    ICON=${(P)ICON_VAR} # Use ${(P)} to resolve variable names dynamically in zsh

    # Stop further checks if a specific icon is already resolved
    if [[ -z "$ICON" ]]; then
        # Declare associative array for groups and their icons
        typeset -A GROUP_CHECK=(
            [AI_APPS]=$ICON_AI
            [DEV_APPS]=$ICON_DEV
            [CHAT_APPS]=$ICON_CHAT
            [MAIL_APPS]=$ICON_MAIL
            [MUSIC_APPS]=$ICON_MUSIC
            [BROWSER_APPS]=$ICON_WEB
            [SETTINGS_APPS]=$ICON_COG
            [TERMINAL_APPS]=$ICON_TERM
        )

        # Function to check app name in a group
        check_group() {
            local group_name="$1[@]" # Reference the array
            local icon_var="$2"      # Associated icon variable

            # Iterate over the apps in the group
            for app in ${(P)group_name}; do
                if [[ "$NORMALIZED_INFO" == "$(echo "$app" | tr '[:upper:]' '[:lower:]')" ]]; then
                    ICON=$icon_var
                    break
                fi
            done
        }

        # Iterate through each group and check for a match
        for group_name icon_var in ${(kv)GROUP_CHECK}; do
            if [[ -z "$ICON" ]]; then
                check_group "$group_name" "$icon_var"
            else
                break
            fi
        done
    fi

    # Fallback to default icon if still unresolved
    ICON=${ICON:-$ICON_APP}

    # Update sketchybar with the resolved icon and app name
    sketchybar --set "$NAME" label="$INFO" icon="$ICON"
fi
