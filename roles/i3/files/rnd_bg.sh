#!/usr/bin/env bash
path="/home/$USER/.dotfiles/roles/i3/files/bg"
one_in_the_bag=$(find "$path" | shuf -n 1 )
feh $one_in_the_bag --bg-scale && wal -i $one_in_the_bag
