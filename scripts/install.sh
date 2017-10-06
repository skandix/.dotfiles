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
olddir=~/.dotfiles_old

# Install all dotfiles
dotfiles=".moc .vim .bashrc .gitconfig .vimrc .Xdefaults .zshrc .Xresources"
for dotfile in $dotfiles; do
    printf "Installing %s...\n" $dotfile    
    ln -s /home/skandix/.dotfiles/files/$dotfile ~/$dotfile 2>/dev/null
done


# Install awesome & Xorg?
read -p "Install Awesome & Xorg? Y/n " option
echo
case "$option" in
    vy|Y ) echo "Yes";
        echo "Installing Xorg";
        sudo apt-get install xorg;
        echo "Installing Awesome";
        sudo apt-get install awesome;
        echo "Copying configs"
        sudo mkdir -p /home/skandix/.config/awesome/;
        sudo cp /etc/xdg/awesome/rc.lua /home/skandix/.config/awesome/;
        sudo chown skandix /home/skandix/.config/awesome/rc.lua;;        
    n|n ) echo "No";;
    * ) echo "Invalid option";;
esac



# Add Public key
read -p "Add public key ? Y/n " option
echo
case "$option" in
    y|Y) echo "Yes";
        mkdir -p /home/skandix/.ssh/;
        touch /home/skandix/.ssh/authorized_keys;
        wget -qO - http://datapor.no/public/skandix_pub > '/home/skandix/.ssh/authorized_keys';;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac

# Install Packages?
read -p "What Packages ? 1: Laptop, 2: Workstation, 3: Server, n/N " option
echo
case "$option" in
    1 ) echo "Laptop"; sudo apt-get install screenfetch vim xbacklight mpv screen pulseaudio pavucontrol tmux python-dev python-pip chromium wicd-curses alsa-utils rxvt-unicode-256color zsh moc -y;;
    2 ) echo "Workstation"; sudo apt-get install screenfetch vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip chromium alsa-utils rxvt-unicode-256color zsh moc -y;;
    3 ) echo "Server"; sudo apt-get install screenfetch screen tmux python3-dev python3-pip python-dev python-pip virtualenvwrapper virtualenv zsh vim -y;;
    #4 ) echo "Minimal Setup"; ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac

# Install Vim plugins?
read -p "Install Vim plugins & oh-my-zsh? Y/n " option
echo
case "$option" in
    y|Y ) echo "Yes";
        echo "Installing Vundle";
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
        echo "Installing oh-my-zsh";
        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh;
        vim +PluginInstall +qall;
        ln -s $dir/Trilambda.zsh-theme ~/.oh-my-zsh/themes/Trilambda.zsh-theme -f;;
    n|n ) echo "No";;
    * ) echo "Invalid option";;
esac

# Install Spotify?
read -p "Install/ Update Spotify? 1: Install, 2:Update, n/N " option
echo
case "$option" in
    1 ) echo "Install"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && sudo apt-get update && sudo apt-get install spotify-client -y ;;
    2 ) echo "Update"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && sudo apt-get update && sudo apt-get install spotify-client -y ;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac

# plz stop thefuckin beeping...!!!
sudo modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf
sudo rm /etc/motd 
