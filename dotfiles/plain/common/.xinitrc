autorandr -c
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
# exec i3
exec xmonad
