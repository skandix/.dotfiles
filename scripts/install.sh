  #/bin/sh
# Refreshing Repo's
user="skandix"
echo "Remember to add contrib and non-free to source list "
apt-get update
apt-get install i3 xorg 
#apt-get install cmus git mpv xbacklight screen pulseaudio pavucontrol tmux nload macchanger python-dev python-pip chromium wicd-curses alsa-utils ipcalc rxvt-unicode-256color firmware-iwlwifi zsh rofi -y
apt-get install cmus git mpv screen pulseaudio pavucontrol tmux nload macchanger python-dev python-pip chromium alsa-utils ipcalc rxvt-unicode-256color zsh rofi -y

# Spotify Client for Linux
$(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+')
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

# Stop BEEPING sound from internal speaker
modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf

#install oh-my-zsh
apt-get update
    #cp ./oh-my-zsh /home/user/.oh-my-zsh/ -rfv 
    #cp dotfiles/.zshrc /home/$user/ -rfv
#urxvt config
    #cp dotfiles/3k/.Xdefaults /home/$user/ -rfv
#bash config
    #cp dotfiles/.bashrc /home/$user/ -rfv
#vim config
    #cp dotfiles/.vimrc /home/$user/ -rfv
    #cp dotfiles/.vim /home/$user/ -rfv
#ohmyzsh theme
    #cp dotfiles/lambda.zsh-theme /home/$user/.oh-my-zsh/themes/ -rfv
#syntapics config
    #mkdir /etc/X11/xorg.conf.d -v
#i3 configs
#cp ../.i3/* /home/$user/.i3 -rfv
<<<<<<< HEAD
cp dotfiles/70-synaptics.conf /etc/X11/xorg.conf.d/ -rfv
cp /home/$user/
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
=======
    #cp dotfiles/70-synaptics.conf /etc/X11/xorg.conf.d/ -rfv
    #sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
>>>>>>> c2b8612fb4103f22109817d7187bf9775b0453b9
