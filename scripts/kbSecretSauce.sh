#!/usr/bin/env bash
dir=/home/skandix/Pictures/screenshot;
localFile="$(deepin-screen-recorder -s $dir 2>&1 --no-notification | grep "savepath2" | cut -d\" -f2)";
echo $localFile
xclip -selection clipboard -t image/png -i $localFile
