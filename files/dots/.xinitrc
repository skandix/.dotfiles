#!/usr/bin/env bash
dbus-update-activation-environment --systemd DISPLAY # Dbus

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) # Keyring
export SSH_AUTH_SOCK

[[ -f ~/.screenlayout/default.sh ]] && sh ~/.screenlayout/default.sh # If xrandr script exists, run that
picom & # Compositor
sh $HOME/.dotfiles/scripts/blanking.sh & # Script for make sure that the screen doesn't go blank
nm-applet & # network manager applet sysicon
tp-battery-icon & # batttery sysicon
pasystray & # pulseaudio sysicon
bash .screenlayout/default.sh &
setxkbmap no & # Set norwegian keyboard layout
#xflux -l 58.283997 -g 8.712829 # flux for linux to make screen more warmer
exec awesome
