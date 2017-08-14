#/bin/sh

# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
############################

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

########## Variables

dir=~/.dotfiles/files
olddir=~/.dotfiles_old
files=".moc .vim .bashrc .gitconfig .vimrc .Xdefaults .zshrc"

##########

# create .dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the .dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing .dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

# adding user to sudo
apt-get install sudo -y 
adduser skandix sudo

# Install awesome & Xorg?
read -p "Install Awesome & Xorg? Y/n " option
echo
case "$option" in
    vy|Y ) echo "Yes";
        echo "Installing Xorg";
        apt-get install xorg;
        echo "Installing Awesome";
        apt-get install awesome;
        echo "Copying configs"
        mkdir -p /home/skandix/.config/awesome/;
        cp /etc/xdg/awesome/rc.lua /home/skandix/.config/awesome/;
        chown skandix /home/skandix/.config/awesome/rc.lua;;        
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
    1 ) echo "Laptop"; apt-get install vim xbacklight mpv screen pulseaudio pavucontrol tmux python-dev python-pip chromium wicd-curses alsa-utils rxvt-unicode-256color firmware-iwlwifi -y zsh moc -y;;
    2 ) echo "Workstation"; apt-get install vim mpv screen pulseaudio pavucontrol tmux python3-dev python3-pip python-dev python-pip chromium alsa-utils rxvt-unicode-256color zsh moc -y;;
    3 ) echo "Server"; apt-get install screen tmux python3-dev python3-pip python-dev python-pip virtualenvwrapper virtualenv zsh vim -y;;
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
        ln -s $dir/Trilambda.zsh-theme /home/skandix/.oh-my-zsh/themes/Trilambda.zsh-theme;;
    n|n ) echo "No";;
    * ) echo "Invalid option";;
esac

# Install Spotify?
read -p "Install/ Update Spotify? 1: Install, 2:Update, n/N " option
echo
case "$option" in
    1 ) echo "Install"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list && apt-get update && apt-get install spotify-client -y;;
    2 ) echo "Update"; $(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+') && apt-get update && apt-get install spotify-client -y;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac

# plz stop thefuckin beeping...!!!
modprobe -r pcspkr
    echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf
