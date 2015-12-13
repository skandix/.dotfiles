apt-get install screen bmon irssi tmux git nload conky macchanger make python-dev iptraf -y 
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C1988
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client
apt-get install pepperflashplugin-nonfree -y
update-pepperflashplugin-nonfree --install
update-pepperflashplugin-nonfree --status
apt-get update -y
apt-get install rtorrent -y
apt-get install ipcalc -y
apt-get install alsa-utils -y
apt-get install rxvt-unicode-256color
apt-get install sudo
