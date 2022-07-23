#!/usr/bin/env bash
background_path="./bg/"
random_background=$(find "$background_path" | shuf -n 1 )
echo "$random_background"
feh "$random_background" --bg-scale && wal -i "$random_background"
