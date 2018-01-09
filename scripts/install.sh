#/bin/sh

echo ""
echo $'______      _                                       '
echo $'|  _  \    | |                                      '
echo $'| | | |__ _| |_ __ _ _ __   ___  _ __   ____   ___  '
echo $'| | | / _  | __/ _` |  _ \ / _ \|  __| |  _ \ / _ \ '
echo $'| |/ / (_| | || (_| | |_) | (_) | | _  | | | | (_) |'
echo $'|___/ \__,_|\__\__,_| .__/ \___/|_|(_) |_| |_|\___/ '
echo $'                    | |                             '
echo $'                    |_|                             '
echo ""

misc=~/.dotfiles/files
dotdir=~/.dotfiles/dotfiles

# Install all dotfiles
dotfiles=".moc .vim .bashrc .gitconfig .vimrc .Xdefaults .zshrc .Xresources"
for dotfile in $dotfiles; do
    printf "[+] symlinking %s...\n" $dotfile
    ln -fs /home/$1/$dotdir/$dotfile ~/$dotfile 2>/dev/null
done


# Install awesome & Xorg?
read -p "$(RED)Install Awesome & Xorg? y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "[+] Installing Xorg";
        sudo apt-get install xorg;

        echo "[+] Installing Awesome";
        sudo apt-get install awesome;

        echo "[+] Copying configs"
        sudo mkdir -p /home/$1/.config/awesome/;
        
        sudo cp /etc/xdg/awesome/rc.lua /home/$1/.config/awesome/;
        sudo chown $1 /home/$1/.config/awesome/rc.lua;;        
    n|n ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# Add Public key
read -p "Add public key ? y/n " option
echo
case "$option" in
    y|Y) echo "Yes";
        mkdir -p /home/$1/.ssh/;
        touch /home/$1/.ssh/authorized_keys;
        wget -qO - $2 >> /home/$1/.ssh/authorized_keys;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# Install Packages?
read -p "What Packages ? 1: Laptop, 2: Workstation, 3: Server, 4: Minimal Server n/N " option
echo
case "$option" in
    1 ) echo "Laptop"; sudo apt-get install screenfetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip alsa-utils rxvt-unicode-256color zsh moc virtualenv virtualenvwrapper dirmngr xbacklight wicd-curses etckeeper firmware-iwlwifi -y;;
    2 ) echo "Workstation"; sudo apt-get install screenfetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip alsa-utils rxvt-unicode-256color zsh moc virtualenv virtualenvwrapper dirmngr etckeeper -y;;
    3 ) echo "Server"; sudo apt-get install screenfetch vim screen tmux python3-dev python3-pip python-dev python-pip zsh virtualenv virtualenvwrapper dirmngr etckeeper -y;;
    4 ) echo "Minimal Server"; sudo apt-get install screenfetch screen tmux zsh vim etckeeper -y;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# Install Vim plugins?
read -p "Install Vim plugins & oh-my-zsh? y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "[+] Installing Vundle";
        git clone https://github.com/gmarik/Vundle.vim.git $selHome/.vim/bundle/Vundle.vim;

    	echo "[+] Installing oh-my-zsh";
        git clone git://github.com/robbyrussell/oh-my-zsh.git $selHome/.oh-my-zsh;
        vim +PluginInstall +qall;
        ln -s $misc/Trilambda.zsh-theme $selHome/.oh-my-zsh/themes/Trilambda.zsh-theme -f;;

    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# install Telegram
read -p "Install Telegram?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q -O linux https://telegram.org/dl/desktop/linux && tar xvf linux && sudo mv Telegram /opt/Telegram && sudo chown $1:$1 /opt/Telegram -R && sudo ln -fs /opt/Telegram/Telegram /bin/Telegram && sudo ln -fs /opt/Telegram/Updater /bin/Updater;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# install firefox
read -p "Install firefox?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && wget -q -O firefax https://download.mozilla.org/\?product\=firefox-latest-ssl\&os\=linux64\&lang\=en-US && tar xvf firefax && sudo mv firefox /opt/ && sudo chown $1:$1 /opt/firefox -R && sudo ln -fs /opt/firefox/firefox /bin/firefox;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# Install Spotify?
read -p "Install/ Update Spotify? 1: Install, 2:Update, n/N " option
echo
case "$option" in
    1 ) echo "Install"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt-get update && sudo apt-get install spotify-client -y ;;
    2 ) echo "Update"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && sudo apt-get update && sudo apt-get install spotify-client -y ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo "\n"

# plz stop thefuckin beeping...!!!
sudo modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf
sudo mv /etc/motd /etc/motd.back

sudo chown $1:$1 /home/$1 -R
cd /home/$1/.config/awesome/
cp rc.lua rc.lua.bak
cp /home/$1/.dotfiles/files/rc.lua /home/$1/.config/awesome -rfv
