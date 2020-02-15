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
bash .screenlayout/default.sh
setxkbmap no &
exec awesome
