#/bin/env bash

## Color Variables
magenta=$'\e[1;35m'
red=$'\e[1;31m'
green=$'\e[1;32m'
cyan=$'\e[1;36m'
normie=$'\e[0m'

motd(){
#Ascii Logo <3
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

##Dirs for Dots and Confs
dots=~/.dotfiles/files/dots/
confs=~/.dotfiles/files/confs/
misc=~/.dotfiles/files/misc/

# Find all Dotfiles and Dotconfigs
dotsDetect=$(find $dots -maxdepth 1 -name '*' ! -name 'dots' ! -name '*.' -printf '%f ')
confsDetect=$(find $confs -maxdepth 1 -name '*' ! -name 'confs' ! -name '*.' -printf '%f ')

exsists(){
# Handy for checking if a dir exists
# exsists <path/file> <specific_thing to say, for example "Creating Dir">
	if [ -d $1 ] 
	then
		echo "$green [O.K] Found $1 $normie"
	else
		echo "$red [Error]: Can't find $1, $2 Dir $normie"
		mkdir -p $1
	fi
}

# Symlink all dotfiles
dotfiles(){
read -p "$cyan [Dotfiles] $normie Symlink dotfiles ? $magenta y/n$normie " option
echo
case "$option" in
	y|Y) echo "$green Yes $normie";
		for dotfile in $dotsDetect; do
			ln -svfn $dots$dotfile ~/$dotfile 2>/dev/null
		done;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

# Symlinks all files that goes in /home/foo/.config
dotconfig(){
read -p "$cyan [DotConfigs] $normie Symlink dotconfig? $magenta y/n$normie " option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		exsists $HOME/.config "Creating Dir"
		for dotconfig in $confsDetect; do
			ln -svfn $confs$dotconfig ~/.config/$dotconfig
		done;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

# What flavor of debian do you want to use
flavor(){
read -p "$cyan [Flavor] $normie What Debian Flavor do you want ? $magenta 1:$normie Stretch (Stable), $magenta 2:$normie Buster (Testing), $magenta 3:$normie Sid (Unstable), $magenta 4:$normie Roll backup" option
echo
case "$option" in
	1 ) echo "Stretch (Stable)";
		cd /etc/apt/;
		sudo cp sources.list sources.list.bak;
		echo -e "###### Debian (Stable)\ndeb http://ftp.no.debian.org/debian/ stretch main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ stretch main contrib non-free\n\ndeb http://ftp.no.debian.org/debian/ stretch-updates main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ stretch-updates main contrib non-free\n\ndeb http://security.debian.org/ stretch/updates main contrib non-free\ndeb-src http://security.debian.org/ stretch/updates main contrib non-free\n" | sudo tee sources.list;;
	
	2 ) echo "Buster (Testing)";
		cd /etc/apt/;
		sudo cp sources.list sources.list.bak;
		echo -e "###### Debian (Testing)\ndeb http://ftp.no.debian.org/debian/ testing main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ testing main contrib non-free\n\ndeb http://ftp.no.debian.org/debian/ testing-updates main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ testing-updates main contrib non-free\n\ndeb http://security.debian.org/ testing/updates main contrib non-free\ndeb-src http://security.debian.org/ testing/updates main contrib non-free\n" | sudo tee sources.list;;
   
   3 ) echo -e "Sid (Unstable)";
	   cd /etc/apt/;
	   sudo cp sources.list sources.list.bak;
	   echo -e "###### Debian (Unstable)\ndeb http://ftp.no.debian.org/debian/ unstable main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ unstable main contrib non-free\n\ndeb http://ftp.no.debian.org/debian/ unstable-updates main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ unstable-updates main contrib non-free\n\ndeb http://security.debian.org/ unstable/updates main contrib non-free\ndeb-src http://security.debian.org/ unstable/updates main contrib non-free\n" | sudo tee sources.list;;
	
	4 ) echo "Roll backup";
		cd /etc/apt/;
		sudo cp sources.list.bak sources.list -fv;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

#Install Awesome, Compton and Xorg
graphics(){
read -p "$cyan [Graphics] $normie Install Awesome, compton & Xorg? $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		sudo apt update;
		sudo apt install xorg awesome compton -y;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

## Install Packages for the specific system i'm running
packages(){
read -p "$cyan [Packages] $normie What Packages? $magenta 1:$normie Laptop, $magenta 2:$normie Workstation, $magenta 3:$normie Server, $magenta 4:$normie Minimal Server" option
echo
case "$option" in
	1 ) echo "$cyan Laptop $normie"; 
		sudo apt install fail2ban rofi neofetch mpv screen pulseaudio pavucontrol tmux python3.7 python3.7-dev alsa-utils rxvt-unicode-256color moc dirmngr xbacklight wicd-curses firmware-iwlwifi ntfs-3g keepassx -y;;

	2 ) echo "$cyan Workstation $normie"; 
		sudo apt install fail2ban rofi neofetch mpv screen pulseaudio pavucontrol tmux python3.7 python3.7-dev alsa-utils rxvt-unicode-256color moc dirmngr ntfs-3g keepassx -y;;

	3 ) echo "$cyan Server $normie"; 
		sudo apt install fail2ban neofetch screen tmux python3.7 python3.7-dev dirmngr ntfs-3g -y;;

	4 ) echo "$cyan Minimal Server $normie";
		sudo apt install fail2ban neofetch screen tmux ntfs-3g -y;;

	n|N|* ) echo "$red No $normie";;
esac
echo
}

# Install Pip & pipenv
pip(){
read -p "$cyan [Pip] $normie Install Pip & Pipenv? $magenta y/n$normie " option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		echo "$cyan [Pip] $normie Installing Pip ";
		cd /tmp;
		wget -q https://bootstrap.pypa.io/get-pip.py;
		python3.7 get-pip.py --user;
		python3 -m pip install --upgrade pip==18.0 --user
		sudo apt install pipenv;;
	n|n|* ) echo "$red No $normie";;
esac
echo
}

##Install Vim plugins?
neovim(){
read -p "$cyan [Neovim] $normie Install Neovim & Vim Plug? $magenta y/n$normie " option
echo
case "$option" in
	y|Y ) echo "Yes";
		echo "\n$cyan [Neovim] $normie Installing Neovim";
		curl -LO https://github.com/neovim/neovim/releases/download/v0.3.1/nvim.appimage
		chmod u+x nvim.appimage;
		sudo mv nvim.appimage /opt;
		sudo ln -sfvn /opt/nvim.appimage /bin/vim;
		exsists /home/$USER/.config/nvim/
		ln -fvsn /home/$USER/.vimrc /home/$USER/.config/nvim/init.vim

		#sudo apt install python3-neovim
		pip3 install --upgrade neovim;
		vim +PlugInstall +all;
		
		echo "\n$cyan [Plug] $normie Installing Vim Pluging Manager";
		curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;;
		
	n|n|* ) echo "$red No";;
esac
echo
}

##Install golang?
golang(){
read -p "$cyan [Golang] $normie Install Golang? $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		cd /tmp;
		# grabs the latest go version, with a bit of hassle with regex... i'll clean that up later now it works :)
		wget -q --prefer-family=ipv4 -O golang_tar $(curl -s https://golang.org/dl/ | egrep '<a class=\"download downloadBox\" href=\"([^\s]+[.linux\-amd64.tar.gz])' | grep linux | cut -d'"' -f 4)
		tar xvf golang_tar;
		sudo mv go /usr/local;;
	n|n|* ) echo "$red No $normie";;
esac
echo
}

# THIRD-PARTY APPLICATIONS
##Install Telegram
telegram(){
read -p "$cyan [Telegram] $normie Install Telegram?  $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		cd /tmp;
		wget -q --prefer-family=ipv4 -O linux https://telegram.org/dl/desktop/linux;
		tar xvf linux;
		sudo mv Telegram /opt/Telegram;
		sudo chown $USER:$USER /opt/Telegram -R;
		sudo ln -fs /opt/Telegram/Telegram /bin/Telegram;
		sudo ln -fs /opt/Telegram/Updater /bin/Updater;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

##Install firefox
firefox(){
read -p "$cyan [Firefox] $normie Install Firefox?  $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie"; 
		cd /tmp
		wget -q --prefer-family=ipv4 -O firefax_tar https://download.mozilla.org/\?product\=firefox-latest-ssl\&os\=linux64\&lang\=en-US;
		tar xvf firefax_tar;
		sudo mv firefox /opt/;
		sudo chown $USER:$USER /opt/firefox -R;
		sudo ln -fs /opt/firefox/firefox /bin/firefox;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

## Instal Discord
firefox(){
read -p "$cyan[Discord] $normie Install Discord?  $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie"; 
		cd /tmp
		wget -q --prefer-family=ipv4 -O discord_deb https://discordapp.com/api/download?platform=linux&format=deb;
		sudo dpkg -i discord_deb;
		sudo apt install -fy;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}


##Install Docker
docker(){
read -p "$cyan [Docker] $normie Install Docker?  $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		cd /tmp
		sudo apt update;
		sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y;
		curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -;
		sudo $(curl -s https://docs.docker.com/install/linux/docker-ce/debian/\#set-up-the-repository | egrep "(apt-key fingerprint ([0-9A-F]{8}))" | cut -d'>' -f 9);
		sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable";
		sudo apt update;
		sudo apt install docker-ce -y;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

##Install Docker-compose
docker_compose(){
read -p "$cyan [Docker-Compose] $normie Install Docker-compose?  $magenta y/n$normie" option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		cd /tmp;
		sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose;
		sudo chmod +x /usr/local/bin/docker-compose;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

##Install Spotify?
spotify(){
read -p "$cyan [Spotify] $normie Install/Update Spotify? $magenta 1:$normie Install, $magenta 2:$normie Update" option
echo
case "$option" in
	1 ) echo "$green Install $normie";
		$(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+');
		echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list;
		sudo apt update;
		sudo apt install spotify-client -y;;

	2 ) echo "Update";
		$(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+');
		sudo apt update;
		sudo apt install spotify-client -y;;
	n|N|* ) echo "$red No $normie";;
esac
echo
}

misc(){
read -p "$cyan [Misc] $normie Rm Motd, and other tweaks...  ?  $magenta y/n$normie " option
echo
case "$option" in
	y|Y ) echo "$green Yes $normie";
		sudo mv /etc/motd /etc/motd.back;
		sudo chown $USER:$USER /home/$USER -R;;
	n|N|*) echo "$red No $normie";;
esac
echo
}

usage(){
    echo "--manual or -m | enables manual mode!
--auto or -a   | auto mode!
--help or -h   | shows this menu"
exit 1
}

### MAIN ###

while [ "$1" != "" ]; do
    case $1 in
        -h | --help )
            motd;
            usage;;
        -m | --manual )
            motd;
            dotfiles;
            dotconfig;
            flavor;
            graphics;
            packages;
            pip;
            neovim;
            golang;
            telegram;
            firefox;
            docker;
            docker_compose;
            spotify;
            misc;;

        -a | --auto )
            # tl;dr if anyone has a better way of doing this.. PLEASE MAKE A PULLREQUEST....THANKS!
            if [ "$2" == "laptop" ]; then
                motd
                echo "y" | dotfiles
                echo "y" | dotconfig
                echo "2" | flavor
                echo "y" | graphics
                echo "1" | packages
                echo "y" | pip
                echo "y" | neovim
                echo "y" | golang
                echo "y" | telegram
                echo "y" | firefox
                echo "1" | spotify
                echo "y" | misc
                exit 1
            
            elif [ "$2" == "workstation" ]; then
                motd
                echo "y" | dotfiles
                echo "y" | dotconfig
                echo "2" | flavor
                echo "y" | graphics
                echo "2" | packages
                echo "y" | pip
                echo "y" | neovim
                echo "y" | golang
                echo "y" | telegram
                echo "y" | firefox
                echo "1" | spotify
                echo "y" | misc
                exit 1

            elif [ "$2" == "server"  ]; then
                motd
                echo "y" | dotfiles
                echo "y" | dotconfig
                echo "1" | flavor
                echo "3" | packages
                echo "y" | pip
                echo "y" | neovim
                echo "y" | golang
                echo "y" | misc
                exit 1

            elif [ "$2" == "minimal-server" ]; then
                motd
                echo "y" | dotfiles
                echo "y" | dotconfig
                echo "4" | packages
                exit 1

            else
                echo "valid args are
                laptop
                workstation
                server
                minimal-server"
                exit 1
            fi;;
    esac
done
