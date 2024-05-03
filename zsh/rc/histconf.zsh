## History config
HISTFILE=$ZDOTDIR/.cache/.zsh_histfile 	# file to save history
HISTSIZE=100000               		# history size in-memory
SAVEHIST=1000000             	 	# history size in the file
HISTORY_IGNORE="(ls|ls *|tr|ll|pwd|exit|clear|cd|cd *|cd -|z|z *|eza|fastfetch|..|...|....|.....)"

## Setopt
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS     # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS        # do not save duplicated command
setopt HIST_REDUCE_BLANKS       # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
