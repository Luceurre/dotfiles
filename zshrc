export LIBVIRT_DEFAULT_URI="qemu:///system"
export EDITOR='nano'

source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle autojump
antigen bundle git
antigen bundle python
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle enhancd

antigen theme theunraveler

antigen apply
