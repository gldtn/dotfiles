#!/usr/bin/env python3

###
# Toggle-theme v1.1 by gldtn
# https://github.com/gldtn/dotfiles/tree/main/.config/alacritty
# Note: import must be present in your alacritty config:
# import = [""]
###

import os
import re
import sys
import shutil
import random

# ANSI color
COLORS = {
    'RED': '\033[91m',
    'GREEN': '\033[92m',
    'CYAN': '\033[96m',
    'BOLD': '\033[1m',
    'RESET': '\033[0m',
}

# Function to underline text
def underline_text(text):
    return '\033[4m' + text + '\033[0m'

# Global variables
script_name = os.path.basename(sys.argv[0]).replace('.py', '')
usage = f"{COLORS['RED']}Usage{COLORS['RESET']}: {script_name} [{COLORS['CYAN']}OPTION{COLORS['RESET']}]\n"

# Directories
user_home = os.path.expanduser('~')
theme_directory = os.path.join(user_home, '.config/alacritty/themes')
term_config = os.path.join(user_home, '.config/alacritty/alacritty.toml')

# Switch themes by index or name
def toggle_theme(theme_input):
    if not theme_input:
        print("Please provide a theme index or name.")
        return None

    applied_theme = None

    if theme_input.isdigit():  # number, treat as index
        index = int(theme_input)
        if 1 <= index <= len(themes):
            applied_theme = themes[index - 1]
    elif theme_input == '-r' or theme_input == '--random':
        applied_theme = random.choice(themes)
    elif theme_input in themes:  # Treat input as theme name
        applied_theme = theme_input

    if applied_theme is not None:
        apply_theme(applied_theme)
        return applied_theme
    else:
        print(f"{COLORS['RED']}Error{COLORS['RESET']}: Invalid input. Please provide a valid theme index or name.")
        return None

# Apply the selected theme
def apply_theme(theme_name):
    theme_config = os.path.join(theme_directory, f'{theme_name}.toml')
    import_line = f'import = ["{os.path.join(theme_directory, f"{theme_name}.toml")}"]'

    with open(term_config, 'r') as f:
        config_content = f.read()

    config_content = re.sub(r'import = \[".*"\]', import_line, config_content)

    with open(term_config, 'w') as f:
        f.write(config_content)

    return theme_name

# List indexed themes
def list_themes():
    global themes
    themes = [f.replace('.toml', '') for f in os.listdir(theme_directory) if f.endswith('.toml')]
    themes.sort()  # sort alphabetically
    print("Available themes:\n")
    for i, theme in enumerate(themes, start=1):
        print(f"{i}. {theme}")
    print("\nSelect by index or name; i.e > toggle-theme 1")

# Options
def display_help():
    options = [
        f"{COLORS['CYAN']}-r, --random{COLORS['RESET']}         : Apply a random theme",
        f"{COLORS['CYAN']}-l, --list{COLORS['RESET']}           : List available themes",
        f"{COLORS['CYAN']}-i, --interactive{COLORS['RESET']}    : Enter interactive mode",
        f"{COLORS['CYAN']}-h, --help{COLORS['RESET']}           : Show available command options",
        f"{COLORS['CYAN']}index/name{COLORS['RESET']}           : Select a theme by index or name",
    ]

    print(f"A simple Alacritty theme switcher written in Python\n")
    print(f"{COLORS['CYAN']}{underline_text(usage)}{COLORS['RESET']}")
    print(f"{COLORS['RED']}{underline_text('Options')}:{COLORS['RESET']}")
    for option in options:
        print(f"    {option}")

# Check arguments to switch, list themes, or display help
if len(sys.argv) < 2:
    print("Please provide a theme index or name.\n")
    print(f"{COLORS['CYAN']}{underline_text(usage)}{COLORS['RESET']}")
    print(f"For more information, try '--help'.")
else:
    theme_input = sys.argv[1]
    if theme_input not in ['-h', '--help', '-l', '--list', '-i', '--interactive']:
        themes = [f.replace('.toml', '') for f in os.listdir(theme_directory) if f.endswith('.toml')]
        themes.sort()  # sort themes alphabetically

        if not themes:
            print("No themes available. Please add themes to /themes/ dir!")
        else:
            if theme_input == '-r' or theme_input == '--random':
                theme_name = random.choice(themes)
                applied_theme = toggle_theme(theme_name)
                if applied_theme:
                    print(f"Theme '{applied_theme}' applied successfully!")
            elif theme_input == '-i' or theme_input == '--interactive':
                list_themes()
                while True:
                    user_input = input("Enter the theme index or name (type 'q' to quit): ")
                    if user_input.lower() == 'q':
                        break
                    applied_theme = toggle_theme(user_input)
                    if applied_theme:
                        print(f"Theme '{applied_theme}' applied successfully!")
            else:
                applied_theme = toggle_theme(theme_input)
                if applied_theme:
                    print(f"Theme '{applied_theme}' applied successfully!")
    elif theme_input in ['-h', '--help']:
        display_help()
    elif theme_input in ['-l', '--list']:
        list_themes()
    elif theme_input in ['-i', '--interactive']:
        list_themes()
        while True:
            user_input = input("Enter the theme index or name (type 'q' to quit): ")
            if user_input.lower() == 'q':
                break
            applied_theme = toggle_theme(user_input)
            if applied_theme:
                print(f"Theme '{applied_theme}' applied successfully!")
