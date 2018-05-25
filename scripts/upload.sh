#!/bin/sh
# need ssh key to server
# USAGE
# upload <filename or path to file>
uname=$(cat /proc/sys/kernel/random/uuid);ext=${1#*.};obfusc="$uname.$ext";mv $1 $obfusc;scp -q $obfusc loot:/var/www/html/loot;echo https://loot.datapor.no/$obfusc | xclip;rm $obfusc -f;