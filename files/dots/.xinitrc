#!/bin/sh

xrdb ~/.Xresources
compton &
feh --bg-scale $HOME/.dotfiles/files/misc/wall.jpg &
exec awesome
