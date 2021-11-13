source ~/.zinit/bin/zinit.zsh

# Local Variable
ZINIT_COMPINIT_DELAY=1

# Configuration
## History
### Variable
builtin export HISTFILE=~/.zsh_history
# change history size in memory
builtin export HISTSIZE=999999999
# change history file size
builtin export SAVEHIST=99999999

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

# Completion
zinit ice blockf atpull'zinit creinstall -q .' 
zinit load zsh-users/zsh-completions

# OMZ Libs
OMZ_LIBS=(
    git.zsh
    directories.zsh
    grep.zsh
    functions.zsh
)
for p in $OMZ_LIBS; do
        zinit ice lucid nocompile wait 
        zinit snippet OMZ::lib/$p
done

# OMZ plugins
OMZ_PLUGINS=(
    rustup
    ruby
    rake
    yarn
    ng
    coffee
    node
    npm
    perl
    git
    github
    mvn
    python
    golang
    man
    nmap
    postgres
    colorize
    rsync
    vundle
    meteor
    gulp
    grunt
    glassfish
    tig
    tmux
    gradle
    grails
    docker-compose
    systemd
)
for p in $OMZ_PLUGINS; do
        zinit ice lucid nocompile wait
        zinit snippet OMZP::$p
done

# OMZ Completions
ZPWR_OMZ_COMPS=(
    scala
    lein
    spring
    redis-cli
    rust
    fd
    docker
)
for p in $OMZ_COMPS; do
        zinit ice svn lucid nocompile as'completion' pick'null' wait
        zinit snippet OMZ::plugins/$p
done

# Open git page - TODO fix ssh remote
# zinit load md-command-line/gh_reveal

# Completion
zinit load Aloxaf/fzf-tab

# History
zinit load zdharma-continuum/history-search-multi-word

# Add sudo
zinit load MenkeTechnologies/zsh-sudo
bindkey '^N' sudo-command-line

# Colorful manual
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-very-colorful-manuals

# Quick search in manual (C-f)
zinit load zdharma-continuum/zui
zinit light MenkeTechnologies/zzcomplete

# Better history
zinit load marlonrichert/zsh-hist
# bindkey "^_" undo
# bindkey "^[q" push-line-or-edit
# bindkey "^[g" get-line

# Completions
zinit ice lucid nocompile
zinit load MenkeTechnologies/zsh-pip-description-completion
zinit ice lucid nocompile
zinit load lukechilds/zsh-better-npm-completion

# Quick jump
zinit load agkozak/zsh-z


# Global Keybinding
# Vim
# builtin bindkey -v

# Commands
zinit ice as'program' lucid nocompile pick'bin/fzf' wait
zinit load junegunn/fzf

zinit ice as"program" pick"bin/git-fuzzy"
zinit light bigH/git-fuzzy


# Need more config
zinit ice lucid nocompile wait
zinit load MenkeTechnologies/forgit

zinit ice lucid nocompile wait'0' 
zinit load hlissner/zsh-autopair

# zinit ice lucid nocompile wait"0b" 
# zinit load MenkeTechnologies/zsh-autocomplete

zinit ice lucid nocompile wait'0e' nocompletions
zinit load MenkeTechnologies/zsh-more-completions

zinit ice lucid nocompile nocd as'null' wait"${ZINIT_COMPINIT_DELAY}g" atinit'zicompinit'
zinit light MenkeTechnologies/zsh-zinit-final

zinit ice lucid nocompile wait"${ZINIT_COMPINIT_DELAY}h" nocompletions
zinit load zdharma-continuum/fast-syntax-highlighting

# Suggestions
zinit ice lucid nocompile wait'0d' atload'_zsh_autosuggest_start'
zinit load zsh-users/zsh-autosuggestions
