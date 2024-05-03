# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# FZF - Fuzzy Finder
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'" # Use BAT for preview
export FZF_DEFAULT_COMMAND="fd --type f" # Use 'fd' instead of 'find'