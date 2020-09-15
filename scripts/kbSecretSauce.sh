#!/usr/bin/env bash
uuid=$(cat /proc/sys/kernel/random/uuid)
dir=$HOME/Pictures/screenshot
localFile="$(deepin-screen-recorder -s $dir 2>&1 --no-notification | grep "saveFilePath" | cut -d\" -f 2)"
screenshot_ext=${localFile#*.}
name="$dir/$uuid.$screenshot_ext"
fileName="$uuid.$screenshot_ext"
cp "$localFile" "$name"
scp -q $name loot:/var/www/html/loot
echo http://datapor.no/loot/$fileName | xclip
