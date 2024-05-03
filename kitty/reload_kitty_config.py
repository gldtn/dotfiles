import os
import subprocess
from pathlib import Path
import time

# Path to kitty.conf
KITTY_CONF_PATH = Path.home() / '.config/kitty/kitty.conf'

# Find the PID of the running kitty instance
def get_kitty_pid():
    try:
        pid = int(subprocess.check_output(['pgrep', '-f', 'kitty']).decode().strip())
        return pid
    except subprocess.CalledProcessError:
        return None

# Function to send signal to reload kitty configuration
def reload_kitty_config(pid):
    subprocess.run(['kill', '-s', 'HUP', str(pid)])

# Watch for changes in kitty.conf
last_modified = KITTY_CONF_PATH.stat().st_mtime
kitty_pid = get_kitty_pid()

while True:
    try:
        current_mtime = KITTY_CONF_PATH.stat().st_mtime
        if current_mtime > last_modified:
            print("Reloading kitty configuration...")
            reload_kitty_config(kitty_pid)
            last_modified = current_mtime
    except FileNotFoundError:
        # Handle the case when kitty.conf is deleted or moved
        print("kitty.conf not found. Exiting...")
        break

    time.sleep(1)
