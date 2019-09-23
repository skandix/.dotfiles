#!/bin/sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
compton &
nm-applet &
dunst &
slack  &
discord &
./.screenlayout/default.sh &
setxkbmap no &
exec awesome
