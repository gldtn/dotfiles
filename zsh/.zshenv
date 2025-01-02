# PATH
export PATH="$PATH:${HOME}/.local/bin:${HOME}/bin:${HOME}/.composer/vendor/bin"
export PATH="($brew --prefix)/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"

# zsh config dir
export ZDOTDIR=${HOME}/.config/zsh
export ZSH_COMPDUMP=${ZDOTDIR:-$HOME}/.cache/.zcompdump

# XDG Paths
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

# Environment variables set everywhere
export LANG="en_US.UTF-8"
# export TERM="xterm-256color"

export BROWSER="Google Chrome"
export EDITOR="ghostty nvim"
export VISUAL="nvim"
export SHELL_SESSIONS_DISABLE=1 # Disable sessions MacOS
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgrep/.ripgreprc"

# Setting PATH for Python 3.11
# The original version is saved in .zprofile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin":$PATH

# Setting PATH for Ruby Gems
#   after installing ruby with brew run: 
#   brew link --overwrite ruby --force
export GEM_HOME="${HOME}/.gem"
export GEM_PATH="${HOME}/.gem"
