#/bin/env bash

## Color Variables
magenta=$'\e[1;35m'
red=$'\e[1;31m'
green=$'\e[1;32m'
cyan=$'\e[1;36m'
normie=$'\e[0m'

echo '$magenta'
echo '______      _                                       '
echo '|  _  \    | |                                      '
echo '| | | |__ _| |_ __ _ _ __   ___  _ __   ____   ___  '
echo '| | | / _  | __/ _` |  _ \ / _ \|  __| |  _ \ / _ \ '
echo '| |/ / (_| | || (_| | |_) | (_) | | _  | | | | (_) |'
echo '|___/ \__,_|\__\__,_| .__/ \___/|_|(_) |_| |_|\___/ '
echo '                    | |                             '
echo '                    |_|                             '
echo '$normie'

##Dirs for Dots and Confs
dots=~/.dotfiles/files/dots/
confs=~/.dotfiles/files/confs/
misc=~/.dotfiles/files/misc/

# Find all Dotfiles and Dotconfigs
dotsDetect=$(find $dots -maxdepth 1 -name '*' ! -name 'dots' ! -name '*.' -printf '%f ')
confsDetect=$(find $confs -maxdepth 1 -name '*' ! -name 'confs' ! -name '*.' -printf '%f ')

# Symlink all dotfiles
read -p "$cyan [Dotfiles] $normie Symlink dotfiles ? Y/n " option
echo
case "$option" in
    y|Y) echo "$green Yes $normie";
        for dotfile in $dotsDetect; do
            ln -svf $dots$dotfile ~/$dotfile 2>/dev/null
        done;;
    n|N ) echo "$red No $normie";;
esac
echo

# Symlinks all files that goes in /home/foo/.config
read -p "$cyan [DotConfigs] $normie Symlink dotconfig? Y/n " option
echo
case "$option" in
    y|Y) echo "Yes";
        if [ -d "$HOME/.config" ] 
    	then
        	echo "$green [O.K] Found .config"
    	else
        	echo "$red [Error]: Can't find .config, creating Dir"
    		mkdir -p $HOME/.config/ 
    	fi
        for dotconfig in $confsDetect; do
            ln -svf $confs$dotconfig ~/.config/$dotconfig 2>/dev/null
        done;;
    n|N ) echo "No";;
esac
echo

# What flavor of debian do you want to use
read -p "$cyan [Flavor] $normie What Debian Flavor do you want ?\n1: Stretch (Stable)\n2: Buster (Testing)\n3: Sid (Unstable)\n4: Roll backup\n)" option
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
    n|N ) echo "$red No $normie";;
esac
echo

#Install Awesome, Compton and Xorg
read -p "$cyan [Graphics] $normie Install Awesome, compton & Xorg? Y/n " option
echo
case "$option" in
    y|Y) echo "$green Yes $normie";
        sudo apt update;
        sudo apt install xorg awesome compton -y;
    n|N ) echo "$red No $normie" ;;
esac
echo

## Install Packages for the specific system i'm running
read -p "$cyan [Packages] $normie What Packages ?\n1: Laptop\n2: Workstation\n3: Server\n4: Minimal Server\n" option
echo
case "$option" in
    1 ) echo "$cyan Laptop $normie"; 
        sudo apt install fail2ban rofi neofetch mpv screen pulseaudio pavucontrol tmux python3.7 python3.7-dev alsa-utils rxvt-unicode-256color zsh moc dirmngr xbacklight wicd-curses firmware-iwlwifi ntfs-3g -y;

    2 ) echo "$cyan Workstation $normie"; 
        sudo apt install fail2ban rofi neofetch mpv screen pulseaudio pavucontrol tmux python3.7 python3.7-dev alsa-utils rxvt-unicode-256color zsh moc dirmngr ntfs-3g -y;;

    3 ) echo "$cyan Server $normie"; 
        sudo apt install fail2ban neofetch screen tmux python3.7 python3.7-dev zsh dirmngr ntfs-3g -y;;

    4 ) echo "$cyan Minimal Server $normie";
        sudo apt install fail2ban neofetch screen tmux zsh ntfs-3g -y;;

    n|N ) echo "$red No $normie";;
esac
echo

# Install Pip & pipenv
https://bootstrap.pypa.io/get-pip.py
read -p "$cyan [Python3] $normie Install Pip & Pipenv? y/n " option
echo
case "$option" in
    y|Y ) echo "$green Yes $normie";
        echo "$cyan [Neovim] $normie Installing Neovim";
        cd /tmp;
        wget -q https://bootstrap.pypa.io/get-pip.py;
        python3.7 get-pip.py --user;
        python3 -m pip install --upgrade pip==18.0 --user
        pip3 install pipenv --user;;;
    n|n ) echo "$red No $normie";;
esac
echo

##Install Vim plugins?
read -p "$cyan [Vim & Zsh] $normie Install Vim plugins & oh-my-zsh? y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "$cyan [Neovim] $normie Installing Neovim";
        curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage;
        chmod u+x nvim.appimage;
        sudo mv nvim.appimage /opt;
        sudo ln -s /opt/nvim.appimage /bin/vim;
        ln -s /home/$USER/.dotfiles/files/.vimrc /home/$USER/.config/nvim/init.vim
        pip3 install --upgrade neovim;
        
        echo "$cyan [Plug] $normie Installing Vim Pluging Manager";
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
        
        echo "$cyan [Oh-My-Zsh] $normie Installing Oh-My-Zsh";
        git clone https://github.com/robbyrussell/oh-my-zsh.git /home/$USER/.oh-my-zsh;
        vim +PlugInstall +qall;
        ln -sf $misc/Trilambda.zsh-theme /home/$USER/.oh-my-zsh/themes/Trilambda.zsh-theme;;

    n|n ) echo "$red No";;
esac
echo

##Install golang?
read -p "$cyan [Golang] $normie Install Golang? y/n " option
echo
case "$option" in
    y|Y ) echo "$green Yes $normie";
        cd /tmp;
		wget -q --prefer-family=ipv4 -O golang_tar https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz;
        tar xvf golang_tar;
        sudo mv go /usr/local;;
    n|n ) echo "$red No $normie";;
esac
echo

# THIRD-PARTY APPLICATIONS
##Install Telegram
read -p "$cyan [Telegram] $normie Install Telegram?  y/n " option
echo
case "$option" in
    y|Y ) echo "$green Yes $normie";
        cd /tmp;
        wget -q --prefer-family=ipv4 -O linux https://telegram.org/dl/desktop/linux;
        tar xvf linux;
        sudo mv Telegram /opt/Telegram;
        sudo chown $USER:$USER /opt/Telegram -R;
        sudo ln -fvs /opt/Telegram/Telegram /bin/Telegram;
        sudo ln -fs /opt/Telegram/Updater /bin/Updater;;
    n|N ) echo "$red No $normie";;
esac
echo

##Install firefox
read -p "$cyan [Firefox] $normie Install Firefox?  y/n " option
echo
case "$option" in
    y|Y ) echo "$green Yes $normie"; 
		cd /tmp
        wget -q --prefer-family=ipv4 -O firefax_tar https://download.mozilla.org/\?product\=firefox-latest-ssl\&os\=linux64\&lang\=en-US;
        tar xf firefax_tar;
        sudo mv firefox /opt/;
        sudo chown $USER:$USER /opt/firefox -R;
        sudo ln -fs /opt/firefox/firefox /bin/firefox;;
    n|N ) echo "$red No $normie";;
esac
echo

##Install Docker
read -p "$cyan [Docker] $normie Install Docker?  y/n " option
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
    n|N ) echo "$red No $normie";;
esac
echo

##Install Docker-compose
read -p "$cyan [Docker-Compose] $normie Install Docker-compose?  y/n " option
echo
case "$option" in
    y|Y ) echo "$green Yes $normie";
        cd /tmp;
        sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose;
        sudo chmod +x /usr/local/bin/docker-compose;;
    n|N ) echo "$red No $normie";;
esac
echo

##Install Spotify?
read -p "$cyan [Spotify] $normie Install/ Update Spotify?\n1: Install\n2: Update\n')" option
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
    n|N ) echo "$red No $normie";;
esac
echo

read -p "$cyan [Misc] $normie Rm Motd, and other tweaks...  ?  y/n " option
echo
case "$option" in
    y|Y ) echo "$green Yes $normie";
        sudo mv /etc/motd /etc/motd.back;
		sudo chown $USER:$USER /home/$USER -Rv;
    n|N ) echo "$red No $normie";;
esac
echo