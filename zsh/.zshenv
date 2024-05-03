# PATH
export PATH="$PATH:${HOME}/.local/bin:${HOME}/bin:${HOME}/.composer/vendor/bin"

# zsh config dir
export ZDOTDIR=${HOME}/.config/zsh
export ZSH_COMPDUMP=${ZDOTDIR:-$HOME}/.cache/.zcompdump

# XDG Paths
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# Environment variables set everywhere
export LANG="en_US.UTF-8"
export TERM="xterm-256color"
export BROWSER="chrome"
export EDITOR="nvim"
export VISUAL="nvim"
export SHELL_SESSIONS_DISABLE=1 # Disable sessions MacOS

### Programs related PATH ###

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin":$PATH
