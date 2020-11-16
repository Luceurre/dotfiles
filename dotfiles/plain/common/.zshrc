export GTAGSLIBPATH=$HOME/.gtags/
ZSH_THEME="agnoster"

autoload -Uz compinit
compinit
source <(antibody init)
antibody bundle < ~/.config/zsh/plugins.txt
