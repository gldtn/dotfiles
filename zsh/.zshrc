# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

### ZAP PLUGINS ###
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# source local files
plug "$HOME/.config/zsh/rc/aliases.zsh"
plug "$HOME/.config/zsh/rc/functions.zsh"
plug "$HOME/.config/zsh/rc/histconf.zsh"

# Load custom functions
fpath=(
    ${ZDOTDIR}/.zsh_functions
    "${fpath[@]}"
)
autoload -Uz kitana;
autoload -Uz brewcup;
autoload -Uz suyabai;
autoload -Uz nvimrm;

# Mostly for neofetch
export WM="Yabai $(yabai --version | awk -F'[- ]' '{print $2}')"
export CPU="$(sysctl -n machdep.cpu.brand_string) - $(smctemp -c)c"
export TERMINAL="Kitty v$(kitty --version | awk '{print $2}')"
export TERM_FONT=$(awk '/font_family/ {print $2}' "${XDG_CONFIG_HOME}/kitty/kitty.conf")

# Load and initialise completion system
autoload -Uz compinit
compinit -d $ZSH_COMPDUMP

### THESE MUST BE PLACED AFTER 'compinit' ###

# case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## load zoxide
# https://github.com/ajeetdsouza/zoxide
export _ZO_FZF_OPTS='1' # must be set before eval
eval "$(zoxide init zsh)"

# eza completions
export FPATH="${HOME}/.config/eza/completions/zsh:$FPATH"

### END: THESE MUST BE PLACED AFTER 'compinit' ##

# fzf - Fuzzy finder
[ -f $ZDOTDIR/.fzf.zsh ] && source $ZDOTDIR/.fzf.zsh

## Load starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"

# Set brew curl path
[ -d "$(brew --prefix)/opt/curl/bin" ] &&
export PATH="$(brew --prefix)/opt/curl/bin:$PATH"
source "$HOME/.openai_key.zsh"
