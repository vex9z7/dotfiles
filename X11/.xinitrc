xrdb -merge $HOME/.config/X11/.Xresources

setxkbmap -option 'caps:ctrl_modifier';xcape -e 'Caps_Lock=Escape'&

exec i3
