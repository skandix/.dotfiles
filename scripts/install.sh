#/bin/sh
# Refreshing Repo's
user="skandix"
apt-get update
apt-get install i3 xorg 
apt-get install cmus mpv xbacklight screen pulseaudio pavucontrol tmux nload macchanger python-dev python-pip chromium wicd-curses alsa-utils ipcalc rxvt-unicode-256color -y

# Spotify Client for Linux
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

# Stop BEEPING sound from internal speaker
modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf

#install oh-my-zsh
apt-get update
apt-get install zsh firmware-iwlwifi
#cp ./oh-my-zsh /home/user/.oh-my-zsh/ -rfv 
cp dotfiles/.zshrc /home/$user/ -rfv
#urxvt config
cp dotfiles/3k/.Xdefaults /home/$user/ -rfv
#bash config
cp dotfiles/.bashrc /home/$user/ -rfv
#vim config
cp dotfiles/.vimrc /home/$user/ -rfv
cp dotfiles/.vim /home/$user/ -rfv
#ohmyzsh theme
#cp dotfiles/lambda.zsh-theme /home/$user/.oh-my-zsh/themes/ -rfv
#syntapics config
mkdir /etc/X11/xorg.conf.d -v
#i3 configs
#cp ../.i3/* /home/$user/.i3 -rfv
cp dotfiles/70-synaptics.conf /etc/X11/xorg.conf.d/ -rfv
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
