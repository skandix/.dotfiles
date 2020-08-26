#/usr/bin/env bash

## Color Variables
magenta=$'\e[1;35m'
red=$'\e[1;31m'
green=$'\e[1;32m'
cyan=$'\e[1;36m'
normie=$'\e[0m'

## Clearing the terminal properly
cls='printf "\033c"'

## String Variables
newline=$'\n'
inputArrow=" ---> "

## Directories
dots=~/.dotfiles/files/dots/
confs=~/.dotfiles/files/confs/
script=~/.dotfiles/scripts/
misc=~/.dotfiles/files/misc/

# Find all dotfiles(.examplerc) and dotconfigs($HOME/.config/example)
dotsDetect=$(find $dots -maxdepth 1 -name '*' ! -name 'dots' ! -name '*.' -printf '%f ')
confsDetect=$(find $confs -maxdepth 1 -name '*' ! -name 'confs' ! -name '*.' -printf '%f ')
#scriptDetect=$(find $script -maxdepth 1 -name '*.sh' -name '*.py' ! -name 'script' ! -name '*.' -printf '%f ')
scriptDetect=$(find $script -maxdepth 1 -type f -iregex '.*\.\(sh\|py\)$' ! -name 'script' ! -name '*.' -printf '%f ')

#wallpapers=$(ls $misc/wallpapers | shuf | head -n 1)
#sudo ln -svfn $misc/wallpapers/$wallpapers /usr/share/awesome/themes/default/background.png;

#dirExsists /home/$USER/.config/nvim/;
#ln -fvsn /home/$USER/.vimrc /home/$USER/.config/nvim/init.vim; #  should be set by the symlink


# create these dirs for later
mkdir $HOME/gitclones 2>1
mkdir $HOME/Projects 2>1
mkdir $HOME/.ssh 2>1

motd(){
    echo ""
    echo "$magenta"
    echo '______      _                                       '
    echo '|  _  \    | |                                      '
    echo '| | | |__ _| |_ __ _ _ __   ___  _ __   ____   ___  '
    echo '| | | / _  | __/ _` |  _ \ / _ \|  __| |  _ \ / _ \ '
    echo '| |/ / (_| | || (_| | |_) | (_) | | _  | | | | (_) |'
    echo '|___/ \__,_|\__\__,_| .__/ \___/|_|(_) |_| |_|\___/ '
    echo '                    | |                             '
    echo '                    |_|                             '
    echo "$normie"
}

# functions for checking if folder exists
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

# Symlink all dotfiles
dotfiles(){
echo ""
echo "$cyan [Dotfiles] $normie Symlink dotfiles"
echo ""
for dotfile in $dotsDetect; do
    ln -svfn $dots$dotfile ~/$dotfile 2>/dev/null
done;
read
echo
}

# Symlinks all files that goes in /home/$USER/.config
dotconfig(){
echo ""
echo "$cyan [DotConfigs] $normie Symlink dotconfig"
echo ""
dirExsists $HOME/.config
for dotconfig in $confsDetect; do
    ln -svfn $confs$dotconfig ~/.config/$dotconfig
done;
read
echo
}


scripts(){
echo ""
echo "$cyan [Scripts] $normie Symlink scripts"
echo ""
for sh in $scriptDetect; do
    sudo ln -svfn $script$sh /usr/bin/$sh
done;
read
echo
}


show_menu() {
motd
echo "
$cyan [MAIN] $normie What do you want to do? $newline$magenta
$magenta 1: $normie dotfiles
$magenta 2: $normie dotconfig
$magenta 3: $normie scripts
"
}

show_options() {
echo ""
read -p "$newline$inputArrow" option
case "$option" in
	1 ) echo "$cyan dotfiles $normie"; dotfiles; $cls;;
	2 ) echo "$cyan dotconfig $normie"; dotconfig; $cls;;
	3 ) echo "$cyan scripts $normie"; scripts; $cls;;
    q ) echo "$red Q U I T $normie"; exit;$cls;;
esac
}

while true
do
    show_menu
    show_options
done
