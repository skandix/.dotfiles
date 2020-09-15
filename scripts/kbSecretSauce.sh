#!/usr/bin/env bash
name=$(cat /proc/sys/kernel/random/uuid).jpg

dir=/home/skandix/Pictures/screenshot
localFile="$(deepin-screenshot -s $dir 2>&1 --no-notification | grep "savepath2" | cut -d\" -f2)"

echo $localFile
scp -q $name loot:/var/www/html/loot
echo http://datapor.no/loot/$name | xclip


#xclip -selection clipboard -t image/png -i $localFile
