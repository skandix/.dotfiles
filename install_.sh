apt-get install screen bmon irssi tmux git nload conky macchanger make python-dev iptraf -y 
echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
apt-get update -qq
apt-get install spotify-client	-y
apt-get install pepperflashplugin-nonfree -y
update-pepperflashplugin-nonfree --install
update-pepperflashplugin-nonfree --status
apt-get update -y
apt-get install vlc browser-plugin-vlc -y
apt-get install rtorrent -y
apt-get install ipcalc -y
apt-get install oracle-java8-installer -y
apt-get install gimp -y