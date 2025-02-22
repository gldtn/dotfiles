# alacritty toggle-theme function
at() { python3 ${XDG_CONFIG_HOME}/alacritty/toggle-theme.py "$@" }

#kitty
kt() { python3 ${XDG_CONFIG_HOME}/kitty/toggle-kitty-theme.py "$@" }

# Neovim
nvimbk() {
    mv ~/.config/nvim{,.bak}
    rm -rf ~/.local/share/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.cache/nvim
}

# CD replacement - Zoxide
## https://github.com/ajeetdsouza/zoxide
alias cd="z"
alias ..="z .."
alias ...="z ../.."
alias ....="z ../../.."
alias .....="z ../../../.."

# Get macOS Software Updates
alias update="sudo softwareupdate -i -a"

# path manipulation
alias :lp="/usr/libexec/path_helper" # list path
alias :le="printenv" # list set environment

# Python
alias python="python3"

# FastFetch
alias ff="clear && fastfetch"
alias fs="clear && fastfetch --config ~/.config/fastfetch/icons.jsonc"
alias fa="clear && fastfetch --config ~/.config/fastfetch/arrows.jsonc"

# Laravel
alias pasc="php artisan db:seed --class=@"
alias pamfs="php artisan migrate:fresh --seed"

# browser-sync
alias :bs="browser-sync start --config bs-config.js"

# CAT replacement - Bat
## https://github.com/sharkdp/bat
alias cat="bat"

# Find replacement - Fd
## https://github.com/sharkdp/fd
alias find="fd"

# LS replacement - eza
## https://github.com/eza-community/eza
ezargs="--icons -I='$(awk '{$1=$1} NF{printf "%s|", $0}' "${ZDOTDIR}/.ezaignore" | sed 's/|$//')' --group-directories-first"

alias ls="eza -lah $ezargs" # all files and dirs; long format
alias lg="eza -Galh $ezargs" # all files and dirs; long format/grid
alias la="eza -a $ezargs" # all files and dirs
alias tr="eza -aT $ezargs" # tree listing
alias ll='eza -l --all --show-symlinks | grep "^l"'
alias l.='eza -la --git-ignore --group-directories-first | egrep "^\."'


# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Brew
alias brew.lc="brew list --cask"
alias brew.lp="brew list --pinned"
alias brew.lf="brew list --formula"
alias brew.uc="brew update && brew upgrade --cask"
alias fixbrew="sudo chown -R $(whoami) /opt/homebrew/* && cleanup"
alias brew.uf="brew update && brew upgrade --formula" # or brew outdated | xargs brew install
alias brew.up="brew update && brew outdated && brew upgrade && brew upgrade --cask && brew upgrade --fetch-HEAD && brew cleanup"

# zsh manipulation
alias ez="nvim \${ZDOTDIR}"
alias sz="source \${ZDOTDIR}/.zshrc"
alias ea="nvim \${ZDOTDIR}/rc/aliases.zsh"
alias va="cat \${ZDOTDIR}/rc/aliases.zsh"
alias sa="source \${ZDOTDIR}/rc/aliases.zsh"

# YADM/Dotfiles
alias yadms="yadm status"
alias yadma="yadm add $@"
alias yadmaa="yadm add -u" # Stage all
alias yadmc="yadm commit -m" # Commit files
alias yadmr="yadm rm --cached" # Remove file
alias yadmp="yadm push -u origin main:main" # Push
alias yadmrebase="yadm pull --rebase origin main" # Rebase

# Yabai/SKHD
alias :yabedit="${EDITOR} \${XDG_CONFIG_HOME}/yabai"
alias :yabupdate="${XDG_CONFIG_HOME}/yabai/./update.sh"
alias :esk="${EDITOR} \${XDG_CONFIG_HOME}/skhd/skhdrc"
alias :yabapp="yabai -m query --windows | jq '.[].app'"
alias :yabtitle="yabai -m query --windows | jq '.[].title'"

# Jankyborders
alias r.borders="brew services restart felixkratz/formulae/borders"

# Alacritty
alias alacritty-new='alacritty msg create-window; open -a Alacritty'
