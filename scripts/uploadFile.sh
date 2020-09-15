#!/usr/bin/env bash
uname=$(cat /proc/sys/kernel/random/uuid);
ext=${1#*.};
obfusc="$uname.$ext";
cp $1 $obfusc;
echo " ";
echo "$1";
echo "$obfusc";
scp -q $obfusc loot:/var/www/html/loot;
echo https://loot.datapor.no/$obfusc | xclip;
rm $obfusc -f;
