#!/usr/bin/env bash

background_path="/home/skandix/.dotfiles/bg/"
random_background="$(ls $background_path | shuf -n 1 )"
feh $background_path$random_background --bg-scale && wal -i $background_path$random_background
