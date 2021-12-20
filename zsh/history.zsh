### Variable
HISTFILE=~/.zsh_history
# change history size in memory
HISTSIZE=999999999
# change history file size
SAVEHIST=99999999

### Flags
# Allow multiple terminal sessions to all append to one zsh command history
builtin setopt append_history

# save timestamp of command and duration
builtin setopt extended_history

# Add comamnds as they are typed, don't wait until shell exit
builtin setopt inc_append_history

# when trimming history, lose oldest duplicates first
builtin setopt hist_expire_dups_first

# Do not write events to history that are duplicates of previous events
builtin setopt hist_ignore_dups

# do not execute, just expand history
builtin setopt hist_verify

# remove command line from history list when first character on the line is a space
builtin setopt hist_ignore_space

# When searching history don't display results already cycled through twice
builtin setopt hist_find_no_dups

# Remove extra blanks from each command line being added to history
builtin setopt hist_reduce_blanks

# do not execute, just expand history
builtin unsetopt hist_verify

# imports new commands and appends typed commands to history
builtin setopt share_history

