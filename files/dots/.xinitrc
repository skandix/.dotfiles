
#!/bin/sh

xrdb ~/.Xresources
compton &
nm-applet &
dunst &
#flameshot >/dev/null 2>&1 &
feh --bg-scale $HOME/.dotfiles/files/misc/wall.jpg &
exec awesome
