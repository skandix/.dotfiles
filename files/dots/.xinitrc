#!/bin/sh
#dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
compton &
nm-applet &
slack  &
discord &
[[ -f ~/.screenlayout/default.sh ]]
setxkbmap no &
exec awesome
