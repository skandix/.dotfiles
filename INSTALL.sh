#/bin/sh
echo -n $'\e[35m'
echo $'______      _                                       '
echo $'|  _  \    | |                                      '
echo $'| | | |__ _| |_ __ _ _ __   ___  _ __   ____   ___  '
echo $'| | | / _  | __/ _` |  _ \ / _ \|  __| |  _ \ / _ \ '
echo $'| |/ / (_| | || (_| | |_) | (_) | | _  | | | | (_) |'
echo $'|___/ \__,_|\__\__,_| .__/ \___/|_|(_) |_| |_|\___/ '
echo $'                    | |                             '
echo $'                    |_|                             '
echo ""
echo -n $'\E[39m'

dir=~/.dotfiles/files

##Symlink Dotfiles ? 
read -p "Symlink dotfiles ? Y/n " option
echo
case "$option" in
    y|Y) echo "Yes"; dotfiles=".moc .vim .bashrc .gitconfig .vimrc .Xdefaults .zshrc .Xresources";
        for dotfile in $dotfiles; do
            printf "Installing %s...\n" $dotfile
            ln -svf /home/$1/.dotfiles/files/$dotfile ~/$dotfile 2>/dev/null
        done;;
    n|N ) echo "No";;
esac
echo

# Add Public key
read -p "Add public key ? Y/n " option
echo
case "$option" in
    y|Y) echo "Yes";
        mkdir -p /home/$1/.ssh/;
        touch /home/$1/.ssh/authorized_keys;
        wget -qO - $2 > '/home/$1/.ssh/authorized_keys';;
    n|N ) echo "No";;
esac
echo

# DEBIAN CORE 
##Set debian flavor
read -p "$(echo -e 'What Debian Flavor do you want ?\n1: Jessie (Oldstable)\n2: Stretch (Stable)\n3:Buster (Testing)\n4:Sid (Unstable)\n5: Roll backup\n\b')" option
echo  
case "$option" in
    1 ) echo "Jessie (Oldstable)"; cd /etc/apt/; sudo cp sources.list sources.list.bak; echo "# Debian Jessie (Oldstable)\ndeb http://deb.debian.org/debian/ oldstable main contrib non-free\n#Security\ndeb http://deb.debian.org/debian-security oldstable/updates main\n" | sudo tee sources.list;; 
    2 ) echo "Stretch (Stable)"; cd /etc/apt/; sudo cp sources.list sources.list.bak; echo "# Debian Stretch (Stable)\ndeb http://deb.debian.org/debian/ stable main contrib non-free\ndeb-src http://deb.debian.org/debian/ stable main contrib non-free\n# Security\ndeb http://deb.debian.org/debian-security stable/updates main\ndeb-src http://deb.debian.org/debian-security stable/updates main\n" | sudo tee sources.list;;
    3 ) echo "Buster (Testing)"; cd /etc/apt/; sudo cp sources.list sources.list.bak; echo "###### Debian Buster (Testing)\ndeb http://deb.debian.org/debian/ testing main contrib non-free\ndeb-src http://deb.debian.org/debian/ testing main contrib non-free\n# Security\ndeb http://deb.debian.org/debian-security testing/updates main\ndeb-src http://deb.debian.org/debian-security testing/updates main\n" | sudo tee sources.list;;
    4 ) echo "Sid (Unstable)"; cd /etc/apt/; sudo cp sources.list sources.list.bak;  echo "###### Debian Main Repos\ndeb http://deb.debian.org/debian/ oldstable main contrib non-free\ndeb http://deb.debian.org/debian-security oldstable/updates main\n" | sudo tee sources.list;;
    5 ) echo "Roll backup"; cd /etc/apt/; sudo cp sources.list.bak sources.list -fv;;
    n|N ) echo "No";;
esac
echo

##Install awesome & Xorg?
read -p "Install Awesome & Xorg? Y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        sudo apt update;
        echo "Installing Xorg";
        sudo apt install xorg -y;
        echo "Installing Awesome";
        sudo apt install awesome -y;
        echo "Copying configs"
        sudo mkdir -pv /home/$1/.config/awesome/;
        sudo cp /etc/xdg/awesome/rc.lua /home/$1/.config/awesome/ -fv;
        sudo chown $1 /home/$1/.config/awesome/rc.lua -v
        cd /home/$1/.config/awesome 
        cp rc.lua rc.lua.bak -v
        cp /home/$1/.dotfiles/files/rc.lua . -v;;        
    n|n ) echo "No";;
esac
echo

##Install Packages?
read -p "$(echo -e 'What Packages ?\n1: Laptop\n2: Workstation\n3: Server\n4: Minimal Server\n\b')" option
echo
case "$option" in
    1 ) echo "Laptop"; sudo apt install fail2ban rofi neofetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip alsa-utils rxvt-unicode-256color zsh moc virtualenv virtualenvwrapper dirmngr xbacklight wicd-curses firmware-iwlwifi -y;;
    2 ) echo "Workstation"; sudo apt install fail2ban rofi neofetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip alsa-utils rxvt-unicode-256color zsh moc virtualenv virtualenvwrapper dirmngr -y;;
    3 ) echo "Server"; sudo apt install fail2ban neofetch vim screen tmux python3-dev python3-pip python-dev python-pip zsh virtualenv virtualenvwrapper dirmngr -y;;
    4 ) echo "Minimal Server"; sudo apt install fail2ban neofetch screen tmux zsh vim -y;;
    n|N ) echo "No";;
esac
echo

##Setup Unattended Upgrades (Security)
read -p "$(echo -e 'Setup Unattended Upgrades ?\n1: 20auto-upgrades,\n2: 02periodic\n\b')" option
echo
case "$option" in
    1 ) echo "20auto-upgrades";sudo apt install unattended-upgrades apt-listchanges -y; echo 'APT::Periodic::Update-Package-Lists "1";\nAPT::Periodic::Unattended-Upgrade "1";' | sudo tee -a /etc/apt/apt.conf.d/20auto-upgrades;;
    2 ) echo "02periodic";echo "#TODO";;
    n|N ) echo "No";;
esac
echo

# apt-get install unattended-upgrades apt-listchanges

##Install gpu driver
read -p "$(echo -e 'What Driver ?\n1: NVIDIA (Without Optimus)\n2: NVIDIA (With Optimus)\n3: AMD\n\b')" option
echo
case "$option" in
    1 ) echo "NVIDIA (Without Optimus)"; echo "# stretch-backports\ndeb http://httpredir.debian.org/debian stretch-backports main contrib non-free" | sudo tee -a && apt-get install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') && sudo apt update && apt install -t stretch-backports nvidia-driver -y;;
    2 ) echo "NVIDIA (With Optimus)"; echo "#TODO";;
    3 ) echo "AMD"; sudo apt update && sudo apt install firmware-amd-graphics -y;;
    n|N ) echo "No";;
esac
echo

##Install Vim plugins?
read -p "Install Vim plugins & oh-my-zsh? y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "Installing Vundle";
        git clone https://github.com/gmarik/Vundle.vim.git /home/$1/.vim/bundle/Vundle.vim;
        echo "Installing oh-my-zsh";
        git clone https://github.com/robbyrussell/oh-my-zsh.git /home/$1/.oh-my-zsh;
        vim +PluginInstall +qall;
        ln -sfv $dir/Trilambda.zsh-theme /home/$1/.oh-my-zsh/themes/Trilambda.zsh-theme;;
    n|n ) echo "No";;
esac
echo

##Install golang?
read -p "Install golang? y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";cd /tmp && wget -q -O golang_tar https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz && tar xvf golang_tar && sudo mv go /usr/local;;
    n|n ) echo "No";;
esac
echo

# THIRD-PARTY APPLICATIONS
##Install Telegram
read -p "Install Telegram?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q -O tg_tar https://telegram.org/dl/desktop/linux && tar xvf tg_tar && sudo mv Telegram /opt/Telegram && sudo chown $1:$1 /opt/Telegram -R && sudo ln -fvs /opt/Telegram/Telegram /bin/Telegram && sudo ln -fs /opt/Telegram/Updater /bin/Updater;;
    n|N ) echo "No";;
esac
echo

##Install firefox
read -p "Install firefox?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q -O firefax_tar https://download.mozilla.org/\?product\=firefox-latest-ssl\&os\=linux64\&lang\=en-US && tar xvf firefax_tar && sudo mv firefox /opt/ && sudo chown $1:$1 /opt/firefox -R && sudo ln -fvs /opt/firefox/firefox /bin/firefox;;
    n|N ) echo "No";;
esac
echo

##Install Docker
read -p "Install Docker?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && sudo apt update && sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && sudo $(curl -s https://docs.docker.com/install/linux/docker-ce/debian/\#set-up-the-repository | egrep "(apt-key fingerprint ([0-9A-F]{8}))" | cut -d'>' -f 9) && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && sudo apt update && sudo apt install docker-ce -y;;
    n|N ) echo "No";;
esac
echo

##Install Docker-compose
read -p "Install Docker-compose?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose;;
    n|N ) echo "No";;
esac
echo


##Install Spotify?
read -p "$(echo -e 'Install/ Update Spotify?\n1: Install\n2:Update\n\b')" option
echo
case "$option" in
    1 ) echo "Install"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt update && sudo apt install spotify-client -y ;;
    2 ) echo "Update"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && sudo apt update && sudo apt install spotify-client -y ;;
    n|N ) echo "No";;
esac
echo

##Install Displaylink
read -p "Install Displaylink?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q https://raw.githubusercontent.com/AdnanHodzic/displaylink-debian/master/displaylink-debian.sh && sudo bash displaylink-debian.sh;;
    n|N ) echo "No";;
esac
echo

# PERSONAL SCRIPTS
##Install personal batch of script 
read -p "install skandix toolbox of somewhat working scripts ?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd $HOME/.dotfiles && sudo cp scripts /opt/scripts && sudo chown $1:$1 /opt/scripts -R && echo "symlink and crontab you self, have to fix..." ;;
    n|N ) echo "No";;
esac
echo

##remove beeping module
read -p "Remove the fucking beeping ?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; sudo modprobe -r pcspkr;echo "# Do not load 'pcspkr' module on boot\n#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf;;
    n|N ) echo "No";;
esac
echo

##Other
read -p "do you want to allow, Permission fix and symlink of rc.lua and neofetch confg ?  y/n " option
echo
case "$option" in
    y|Y ) echo "";sudo mv /etc/motd /etc/motd.back;sudo chown $1:$1 /home/$1 -R;cd /home/$1/.config/awesome/;cp rc.lua rc.lua.bak;ln -svf /home/$1/.dotfiles/files/rc.lua /home/$1/.config/awesome/rc.lua -rfv;ln -svf /home/$1/.dotfiles/files/config_neofetch /home/$1/.config/neofetch/config;;
    n|N ) echo "No";;
esac
echo


## TODO 
#TouchScreen
##https://boundarydevices.com/debian-in-more-depth-adding-touch-support/