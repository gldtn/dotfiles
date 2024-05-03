import os
import re
import argparse

def parse_kitty_theme(theme_text):
    color_settings = {}

    # Define the regex pattern for matching color settings
    color_pattern = re.compile(r'((color[0-9]+)|([a-zA-Z_]+))\s+([#a-fA-F0-9]+)')

    # Split the theme text into lines
    lines = theme_text.split('\n')

    for line in lines:
        match = color_pattern.match(line.strip())
        if match:
            setting, _, _, color = match.groups()
            color_settings[setting] = color

    return color_settings

def read_theme_file(file_path):
    try:
        with open(file_path, 'r') as file:
            theme_text = file.read()
        return theme_text
    except FileNotFoundError:
        print(f"Error: Theme file not found at {file_path}")
        return None

def extract_color_name(theme_text):
    match = re.search(r'##\s*name:\s*([\w\s]+)', theme_text)
    if match:
        return match.group(1).strip()
    else:
        return None

def show_color_chart():
    # ANSI color codes from the provided bash script
    color_chart_script = r"""
T='•••'   # The text for the color test

printf "\n         def    40m    41m    42m    43m    44m    45m    46m    47m\n"

for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
           '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
           '  36m' '1;36m' '  37m' '1;37m';
do
  FG=${FGs// /}
  printf " $FGs \033[$FG  $T  "
  for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
  do
    printf "\033[$FG\033[$BG  $T  \033[0m"
  done
  echo
done

printf "\n"  # Inserted blank line here
"""

    # Print the ANSI color chart
    os.system(color_chart_script)

def show_color_settings(theme_text):
    # Print the color settings in the order they appear in the theme file
    color_settings = parse_kitty_theme(theme_text)

    for line in theme_text.split('\n'):
        match = re.match(r'((color[0-9]+)|([a-zA-Z_]+))\s+#([a-fA-F0-9]+)', line.strip())
        if match:
            setting, _, _, color = match.groups()
            print(f"{setting}: {boldon}\033[38;2;{int(color[0:2], 16)};{int(color[2:4], 16)};{int(color[4:], 16)}m#{color}{reset}")

def show_theme_info(theme_text):
    # Extract the color name
    color_name = extract_color_name(theme_text)

    if color_name:
        print(f"{boldon}{redf}   {color_name}   {reset}")
    else:
        print(f"{boldon}{redf}   Unknown Color Theme   {reset}")

if __name__ == "__main__":
    # Get the home directory path
    home_directory = os.path.expanduser("~")

    # Specify the path to the Kitty theme file
    theme_file_path = f"{home_directory}/.config/kitty/themes/rose-pine-moon.conf"

    # ANSI color codes
    esc = "\033"
    boldon = f"{esc}[1m"
    redf = f"{esc}[31m"
    reset = f"{esc}[0m"

    # Read the theme file
    kitty_theme_text = read_theme_file(theme_file_path)

    if kitty_theme_text:
        # Parse command-line arguments
        parser = argparse.ArgumentParser(description="Show Kitty theme information.")
        parser.add_argument("--show-chart", "-c", action="store_true", help="Show the ANSI color chart")
        parser.add_argument("--show-settings", "-s", action="store_true", help="Show the color settings")
        args = parser.parse_args()

        # Show theme information based on command-line arguments
        show_theme_info(kitty_theme_text)

        if args.show_chart:
            show_color_chart()

        if args.show_settings:
            show_color_settings(kitty_theme_text)
