#!/usr/bin/env bash
dbus-update-activation-environment --systemd DISPLAY # Dbus

eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)" # Keyring
export SSH_AUTH_SOCK

export XSECURELOCK_BLANK_TIMEOUT=900
export XSECURELOCK_PASSWORD_PROMPT=time_hex
export XSECURELOCK_SAVER=saver_xscreensaver
export XSECURELOCK_SAVER_RESET_ON_AUTH_CLOSE=1
export XSECURELOCK_SHOW_DATETIME=1
export XSECURELOCK_AUTH_BACKGROUND_COLOR=rgb:1,0,1
export XSECURELOCK_AUTH_WARNING_COLOR=rgb:1,0,0

[[ -f ~/.screenlayout/default.sh ]] && sh ~/.screenlayout/default.sh # If xrandr script exists, run that
exec i3 # yeet i3 lets gooo
