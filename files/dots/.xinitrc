
#!/bin/sh

xrdb ~/.Xresources
compton &
nm-applet &
dunst &
slack  &
discor &
#flameshot >/dev/null 2>&1 &
feh --bg-scale $HOME/.dotfiles/files/misc/wall.jpg &
setxkbmap no &
exec awesome
