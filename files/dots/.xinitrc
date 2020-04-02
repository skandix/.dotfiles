#!/usr/bin/env bash
dbus-update-activation-environment --systemd DISPLAY

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

[[ -f ~/.screenlayout/default.sh ]] && sh ~/.screenlayout/default.sh
picom &
nm-applet &
tp-battery-icon &
pasystray &
discord &
xrdb -merge .Xresources &
bash .screenlayout/default.sh &
setxkbmap no &
#xflux -l 58.283997 -g 8.712829 
exec awesome
