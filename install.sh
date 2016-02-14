#/bin/sh
# Refreshing Repo's
apt-get update

# Installing the Packages i need
echo 'Installing Packages i need, to be productive :3'
apt-get awesome xorg alsa-utils vim install screen bmon vim irssi curl tmux nload conky arandr macchanger make python-dev chromium wicd-curses rtorrent alsa-utils ipcalc rxvt-unicode-256color sudo iptraf -y 

# installing Pulseaudio - so i can use my Focusrite Scarlett 2i4 and Logitech G930
echo 'Installing Pulseaudio'
apt-get install pulseaudio
apt-get install pavucontroll

# Spotify Client for Linux - Add a script to grep latest, keys for keyserver..from https://www.spotify.com/no/download/linux/
echo 'Installing Spotify-client'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

# Pepperflash is Flash for linux - flash is getting old, and some actually use this shit.. ._.
echo 'Installing PepperFlash'
apt-get install pepperflashplugin-nonfree -y
update-pepperflashplugin-nonfree --install
update-pepperflashplugin-nonfree --status

#Sublime Text 3 x64
echo 'Installing Sublime Text3 x64'
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
dpkg -i sublime-text_build-3083_amd64.deb 

# Sublime Text 3 i386
# wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_i386.deb
# sudo dpkg -i sublime-text_build-3083_i386.deb

# Stop BEEPING sound from internal speaker
echo 'Removing Beeping Sound from internal speaker :)'
modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf

# Here i'll append some lines to the source.list file so i can install the awesome i want..
echo 'Installing Awesome & Appending experimental to source.list'
echo "# REMEMBER TO UNCOMMENT THIS SHIT!!!, IF NOT IT WILL CAUSE PROBLEMS LATER!" | sudo tee -a /etc/apt/sources.list
echo "#EXPERIMENTAL" | sudo tee -a /etc/apt/sources.list
echo "deb http://ftp.us.debian.org/debian/ experimental main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "#SID" | sudo tee -a /etc/apt/sources.list
echo "deb http://ftp.us.debian.org/debian/ sid main contrib non-free " | sudo tee -a /etc/apt/sources.list
echo "deb http://http.debian.net/debian/ wheezy main non-free contrib " | sudo tee -a /etc/apt/sources.list
echo "deb-src http://http.debian.net/debian/ wheezy main non-free contrib" | sudo tee -a /etc/apt/sources.list
echo "# REMEMBER TO UNCOMMENT THIS SHIT!!!, IF NOT IT WILL CAUSE PROBLEMS LATER!" | sudo tee -a /etc/apt/sources.list

apt-get update
apt-get install screenfetch -y
apt-get -t experimental install awesome -y

# making awesome folder visible in .config at your homepath
mkdir -p ~/.config/awesome/
cp /etc/xdg/awesome/rc.lua ~/.config/awesome/
chown skandix ~/.config/awesome/rc.lua

echo 'REMEMBER TO UNCOMMENT EXPERIMENTAL LINES FROM SOURCE.LIST'
echo 'AND TO RUN VISUDO!'
