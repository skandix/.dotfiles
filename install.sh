#!/bin/bash
# Rmbr git
echo "Doing updates and such to make things go faster.. to save time"
sleep 2
clear
echo "Copying dotfiles"
cp ../confis/.bashrc $home
cp ../configs/.bashrc /root/
cp ../configs/.conkyrc $home
sleep 3
echo "Dotfiles copied to all users and root"
sleep 3
clear
echo "Add your user to visudo $username ALL=(ALL:ALL) ALL"
sleep 2
clear
visudo
clear
Echo "Adding lines to sources.list and installing software, now you can safely go whatever you want to do.."
sleep 2
# adding experimental awesome to sources.list with echo
echo “#EXPERIMENTAL
deb http://ftp.us.debian.org/debian/ experimental main contrib non-free
#SID
deb http://ftp.us.debian.org/debian/ sid main contrib non-free
deb http://http.debian.net/debian/ wheezy main non-free contrib
deb-src http://http.debian.net/debian/ wheezy main non-free contrib” >> /etc/apt/sources.list
# Installing Awesome WM EXPERIMENTAL
apt-get update
apt-get install xorg awesome alsa-utils vim screenfetch
apt-get -t experimental install awesome 
# Stop Pc Beep
modprobe -r pcspkr
echo "# Do not load 'pcspkr' module on boot
blacklist pcspkr" >> /etc/modprobe.d/nobeep.conf
# installing wifi wicd
aptitude update
aptitude install wicd
# Installing Chromium Browser
apt-get install chromium-browser
# Installing some tools i use / need
apt-get install screen bmon irssi tmux git nload conky macchanger make python-dev iptraf  
# adding repo, keys to install Spotify
echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
apt-get update -qq
apt-get install spotify-client	
# installing pepperflash, since adobe flash don't always work that well.
apt-get install pepperflashplugin-nonfree
update-pepperflashplugin-nonfree --install
update-pepperflashplugin-nonfree --status
# check for updates again
apt-get update -y
# installing VLC, just because i'm not sure if MPC:HC is on linux yet :P
apt-get install vlc browser-plugin-vlc
# installing rtorrent, torrent client for linux
apt-get install rtorrent
#installing ipcalc
apt-get install ipcalc
# installing java
apt-get install oracle-java8-installer
#installing gimp 
apt-get install gimp
#copycats theme pack
cd $home
git clone --recursive https://github.com/copycat-killer/awesome-copycats.git
cd awesome-copycats && cp ~/awesome-copycats/ ~/.config/awesome
clear
echo "Done installing updates and software"
sleep 2
echo "Have a good day ;)"
