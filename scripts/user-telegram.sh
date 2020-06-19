#!/usr/bin/env bash
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

dirExsists $HOME/.local/share/TelegramDesktop/$USER
/usr/bin/telegram-desktop -workdir $HOME/.local/share/TelegramDesktop/$USER -- %u
