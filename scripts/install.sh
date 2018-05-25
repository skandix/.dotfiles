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

# Install all dotfiles
dotfiles=".moc .vim .bashrc .gitconfig .vimrc .Xdefaults .zshrc .Xresources"
for dotfile in $dotfiles; do
    printf "Installing %s...\n" $dotfile    
    ln -svf /home/$1/.dotfiles/files/$dotfile ~/$dotfile 2>/dev/null
done

read -p "What Debian Flavor do you want ?"
echo  
case "$option" in
    1 ) echo "Jessie (Oldstable)"; cd /etc/apt/ && sudo cp sources.list sources.list.bak && cat > sources.list << EOF 
        # Debian Jessie (Oldstable)
        deb http://deb.debian.org/debian/ oldstable main contrib non-free
        
        #Security
        deb http://deb.debian.org/debian-security oldstable/updates main
        EOL ;;

    2 ) echo "Stretch (Stable)"; cd /etc/apt/ && sudo cp sources.list sources.list.bak && cat > sources.list << EOF 
        # Debian Stretch (Stable) 
        deb http://deb.debian.org/debian/ stable main contrib non-free
        deb-src http://deb.debian.org/debian/ stable main contrib non-free

        # Security
        deb http://deb.debian.org/debian-security stable/updates main
        deb-src http://deb.debian.org/debian-security stable/updates main
        EOL ;;

    3 ) echo "Buster (Testing)"; cd /etc/apt/ && sudo cp sources.list sources.list.bak && cat > sources.list << EOF 
        ###### Debian Buster (Testing)
        deb http://deb.debian.org/debian/ testing main contrib non-free
        deb-src http://deb.debian.org/debian/ testing main contrib non-free

        # Security 
        deb http://deb.debian.org/debian-security testing/updates main
        deb-src http://deb.debian.org/debian-security testing/updates main
        EOL ;;

    4 ) echo "Sid (Unstable)"; cd /etc/apt/ && sudo cp sources.list sources.list.bak && cat > sources.list << EOF 
        ###### Debian Main Repos
        deb http://deb.debian.org/debian/ oldstable main contrib non-free
        deb http://deb.debian.org/debian-security oldstable/updates main
        EOL ;;

    5 ) echo "Roll backup ()"; cd /etc/apt/ && sudo cp sources.list.bak sources.list && ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# Install awesome & Xorg?
read -p "Install Awesome & Xorg? Y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "Installing Xorg";
        sudo apt-get install xorg;
        echo "Installing Awesome";
        sudo apt-get install awesome;
        echo "Copying configs"
        sudo mkdir -p /home/$1/.config/awesome/;
        sudo cp /etc/xdg/awesome/rc.lua /home/$1/.config/awesome/;
        sudo chown $1 /home/$1/.config/awesome/rc.lua;;        
    n|n ) echo "No";;
    * ) echo "Invalid option";;
esacsi  
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
    * ) echo "Invalid option";;
esac
echo

# Install Packages?
read -p "What Packages ? 1: Laptop, 2: Workstation, 3: Server, 4: Minimal Server, n/N " option
echo
case "$option" in
    1 ) echo "Laptop"         ; sudo apt-get install neofetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip alsa-utils rxvt-unicode-256color zsh moc virtualenv virtualenvwrapper dirmngr xbacklight wicd-curses firmware-iwlwifi -y ;;
    2 ) echo "Workstation"    ; sudo apt-get install neofetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip alsa-utils rxvt-unicode-256color zsh moc virtualenv virtualenvwrapper dirmngr -y                                         ;;
    3 ) echo "Server"         ; sudo apt-get install neofetch vim screen tmux python3-dev python3-pip python-dev python-pip zsh virtualenv virtualenvwrapper dirmngr -y                                                                                                         ;;
    4 ) echo "Minimal Server" ; sudo apt-get install neofetch screen tmux zsh vim -y                                                                                                                                                                                            ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# Install Vim plugins?
read -p "Install Vim plugins & oh-my-zsh? Y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "Installing Vundle";
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
        echo "Installing oh-my-zsh";
        git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
        vim +PluginInstall +qall;
        ln -s $dir/Trilambda.zsh-theme ~/.oh-my-zsh/themes/Trilambda.zsh-theme -f;;
    n|n ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install Docker
read -p "Install Docker?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && sudo apt update && sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && sudo $(curl -s https://docs.docker.com/install/linux/docker-ce/debian/\#set-up-the-repository | egrep "(apt-key fingerprint ([0-9A-F]{8}))" | cut -d'>' -f 9) && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && sudo apt update && sudo apt install docker-ce -y;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install Telegram
read -p "Install Telegram?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q -O linux https://telegram.org/dl/desktop/linux && tar xvf linux && sudo mv Telegram /opt/Telegram && sudo chown $1:$1 /opt/Telegram -R && sudo ln -fs /opt/Telegram/Telegram /bin/Telegram && sudo ln -fs /opt/Telegram/Updater /bin/Updater;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install firefox
read -p "Install firefox?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q -O firefax https://download.mozilla.org/\?product\=firefox-latest-ssl\&os\=linux64\&lang\=en-US && tar xvf firefax && sudo mv firefox /opt/ && sudo chown $1:$1 /opt/firefox -R && sudo ln -fs /opt/firefox/firefox /bin/firefox;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install gpu drivers
read -p "What Packages ? 1: AMD, 2: NVIDIA, n/N " option
echo
case "$option" in
    1 ) echo "AMD"    ; cat >> sources.list << EOF
    # stretch-backports
    deb http://httpredir.debian.org/debian stretch-backports main contrib non-free  
    EOL && sudo apt update  
    ;;
    2 ) echo "NVIDIA" ;  ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install skandix toolbox of somewhat working scripts ? 
read -p "install skandix toolbox of somewhat working scripts ?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; ;;
    n|N ) echo "No"; ;;
    * ) echo "Invalid option";;
esac
echo

# Install Spotify?
read -p "Install/ Update Spotify? 1: Install, 2:Update, n/N " option
echo
case "$option" in
    1 ) echo "Install"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt-get update && sudo apt-get install spotify-client -y ;;
    2 ) echo "Update"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && sudo apt-get update && sudo apt-get install spotify-client -y ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# plz stop thefuckin beeping...!!!
sudo modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf
sudo mv /etc/motd /etc/motd.back

sudo chown $1:$1 /home/$1 -R
cd /home/$1/.config/awesome/
cp rc.lua rc.lua.bak
cp /home/$1/.dotfiles/files/rc.lua /home/$1/.config/awesome -rfv