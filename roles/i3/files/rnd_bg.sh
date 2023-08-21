#!/usr/bin/env bash
path="$HOME/.wallpapers/"
one_in_the_bag=$(find "$path" | shuf -n 1 )
feh $one_in_the_bag --bg-scale && wal -i $one_in_the_bag
