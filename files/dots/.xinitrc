#!/bin/sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
compton &
nm-applet &
#dunst &
slack  &
discord &
./.screenlayout/default.sh &
#flameshot >/dev/null 2>&1 &
feh --bg-scale $HOME/.dotfiles/files/misc/wall.jpg &
setxkbmap no &
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK
exec awesome
