#!/bin/sh

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr
sxhkd &
compton &
~/.config/polybar/launch.sh &
./.screenlayout/def.sh
feh --bg-scale $HOME/.dotfiles/files/misc/wall.jpg &
exec bspwm
