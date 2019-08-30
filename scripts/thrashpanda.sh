#!/usr/bin/env bash

## Color Variables
magenta=$'\e[1;35m'
red=$'\e[1;31m'
green=$'\e[1;32m'
cyan=$'\e[1;36m'
normie=$'\e[0m'

## Other Variables that makes using this shit alot easier
DOMAIN='https://loot.datapor.no/'
HOST='datapor.no'
USER='loot'
IDENTITY='$HOME/.ssh/id_rsa'

## Variables you don't want to touch except you _actually_ know what you are doing
namePATTERN=$(cat /proc/sys/kernel/random/uuid)

dirExsists(){
echo ""
	if [ -d $1 ]
	then
		echo "$green [O.K] Found $1 $normie"
	else
		echo "$red [Error]: Can't find $1, Creating directory $normie"
		mkdir -p $1
	fi
}

usage(){
    echo "screenshot -s\nupload -u\n"
}

notify()
{
    TITLE="THRASH PANDA"
    MESSAGE="$2"
    notify-send --expire-time 5000 "$TITLE" "$MESSAGE"
}

screenshot()
{
    targetDir="$HOME/Pictures/screenshot"
    dirExsists $targetDir
    cd $targetDir
    ext=".jpg"
    import $namePATTERN$ext;
    scp -q $namePATTERN$ext loot:/var/www/html/loot;
    load=$DOMAIN$namePATTERN$ext
    echo $load | xclip;
    notify "Screenshot Uploaded to $DOMAIN";
}


beamitupscotty(){
    ext=${1#*.};
    obfusc="$namePATTERN.$ext";
    mv $1 $obfusc;
    scp -q $obfusc loot:/var/www/html/loot;
    load=$DOMAIN$obfusc
    echo $load | xclip;

    notify "Uploaded $obfusc to $DOMAIN";
    rm $obfusc -f;
}



### MAIN ###
case $1 in
	-h | --help )
		usage;;
	-s | --screenshot )
        screenshot;;
    -u | --upload )
        beamitupscotty $2;;
esac
