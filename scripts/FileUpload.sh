#!/usr/bin/env bash
input=$1
uname=$(cat /proc/sys/kernel/random/uuid)
ext=${1#*.}
obfusc="$uname.$ext"
cp "$input" "$obfusc" -rfv
#zap=zip -r $uname.zip "$obfusc"
scp -q $obfusc loot:/var/www/html/loot
echo https://loot.datapor.no/$obfusc | xclip
rm $obfusc -f
