# From ZPWR (I don't really understand it, but whatever)

function zpwrDedupPaths() {
    # duplicates slow down searching and
    # mess up OMZ fpath check if should remove zcompdump
    fpath=(${(u)fpath})
    path=(${(u)path})
    manpath=(${(u)manpath})
}

# duplicates slow down searching
builtin declare -aU fpath
builtin declare -aU path
builtin declare -aU manpath
# FPATH should not be exported
builtin declare +x FPATH
zpwrDedupPaths

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.zinit/bin/zinit.zsh

# Local Variable
ZINIT_COMPINIT_DELAY=1

# Configuration
## Git
DISABLE_UNTRACKED_FILES_DIRTY="true"

## History
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

## Keybindings

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

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

# Enhancd
zinit ice wait lucid
zinit light b4b4r07/enhancd
builtin export ENHANCD_FILTER=fzf:fzy:peco

# Tmux
zinit ice lucid pick"plugins/tmux/tmux.plugin.zsh" nocompile atinit"ZSH_TMUX_AUTOSTART=true; ZSH_TMUX_AUTOCONNECT=false"
zinit light ohmyzsh/ohmyzsh

# Pyenv
zinit ice lucid nocompile pick"zsh-pyenv.plugin.zsh"
zinit light mattberther/zsh-pyenv

# Global Keybinding
# Vim
# builtin bindkey -v

# Commands
zinit ice as'program' lucid nocompile pick'bin/fzf' wait
zinit load junegunn/fzf

zinit ice as"program" pick"bin/git-fuzzy"
zinit light bigH/git-fuzzy

zinit ice wait"2" lucid from"gh-r" as"program" mv"bin/exa* -> exa"
zinit light ogham/exa

zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep
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


# Theme and powerline
# zinit ice wait"!" from"gh-r" \
#        atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#        atpull"%atclon" src"init.zsh"
# zinit light starship/starship
zinit ice depth=1
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
