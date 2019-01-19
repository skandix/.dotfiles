#!/bin/sh

xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

compton &
feh --bg-scale  ~/Pictures/current.jpg &

sxhkd &
exec bspwm
