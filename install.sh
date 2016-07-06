#/bin/sh
# Refreshing Repo's
apt-get update
apt-get install zsh -y

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#adding the .theme file i customized later :)

# Installing the Packages i need
apt-get install cmus vlc awesome xbacklight xorg screen pulseaudio pavucontrol bmon vim irssi curl tmux nload conky macchanger make python-dev python-pip chromium wicd-curses alsa-utils ipcalc rxvt-unicode-256color sudo iptraf iwconfig  -y 

# Spotify Client for Linux
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C1988
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

# Pepperflash is Flash for linux
apt-get install pepperflashplugin-nonfree -y
update-pepperflashplugin-nonfree --install
update-pepperflashplugin-nonfree --status

#Sublime Text 3 x64
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
dpkg -i sublime-text_build-3083_amd64.deb 

# Sublime Text 3 i386
# wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_i386.deb
# sudo dpkg -i sublime-text_build-3083_i386.deb

# Stop BEEPING sound from internal speaker
modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf

echo 'Installing Awesome & Appending experimental to source.list'
echo "#EXPERIMENTAL" | sudo tee -a /etc/apt/sources.list
echo "deb http://ftp.us.debian.org/debian/ experimental main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "#SID" | sudo tee -a /etc/apt/sources.list
echo "deb http://ftp.us.debian.org/debian/ sid main contrib non-free " | sudo tee -a /etc/apt/sources.list
echo "deb http://http.debian.net/debian/ wheezy main non-free contrib " | sudo tee -a /etc/apt/sources.list
echo "deb-src http://http.debian.net/debian/ wheezy main non-free contrib" | sudo tee -a /etc/apt/sources.list

apt-get update
apt-get install screenfetch -y
apt-get -t experimental install awesome -y

# making awesome folder visible in .config at your homepath
echo "mkdir -p ~/.config/awesome/"
echo "cp /etc/xdg/awesome/rc.lua ~/.config/awesome/"
echo "chown 'whoami' ~/.config/awesome/rc.lua"
