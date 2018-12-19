#!/bin/sh
# need ssh key to server
cd $HOME/Pictures
name=$(cat /proc/sys/kernel/random/uuid).jpg;import $name;scp -i ~/.ssh/id_rsa -q $name loot@loot:/var/www/html/loot;echo https://loot.datapor.no/$name | xclip;
