#!/usr/bin/env bash
path="/home/$USER/.dotfiles/roles/i3/files/bg"
feh "$(find "$path" | shuf -n 1 )" --bg-scale && wal -i "$(find "$path" | shuf -n 1 )"
