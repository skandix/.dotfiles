#!/bin/sh
# need ssh key to server
cd $HOME/Pictures
name=$(cat /proc/sys/kernel/random/uuid).jpg;import $name;scp -q $name loot:/var/www/html/loot;echo https://loot.datapor.no/$name | xclip;