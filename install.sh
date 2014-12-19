#!/bin/bash
echo "Doing updates and such to make things go faster.. to save time"
# Doing a update on all the sources.list to get the newest updates, then install updates and then dist-upgrade if any new updates
apt-get update -y && apt-get upgrade -y && apt-get dist upgrade -y
# Installing Awesome WM
apt-get install awesome
# installing sublime text 2
add-apt-repository ppa:webupd8team/sublime-text-2
apt-get update
apt-get install sublime-text
# Installing Chromium Browser
apt-get install chromium-browser
# Installing some tools i use / need
apt-get install screen vim bmon irssi tmux git nload conky macchanger make python-dev iptraf steam 
# adding repo, keys to install Spotify
apt-add-repository -y "deb http://repository.spotify.com stable non-free"
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
# adding repo to Transmission, torrent client for linux
add-apt-repository ppa:transmissionbt/ppa
apt-get update 
apt-get install transmission
# Google drive for linux
add-apt-repository ppa:thefanclub/grive-tools
apt-get update
apt-get install gdrive-tools
# adding screenfetch repo, and install of it
apt-add-repository ppa:djcj/screenfetch
apt-get update
apt-get install screenfetch
#installing ipcalc
apt-get install ipcalc
# installing java
apt-add-repository ppa:webupd8team/java
apt-get update
apt-get install oracle-java8-installer
#installing gimp 
apt-get install gimp

# need to add all of the basic software for archlinux..
#then setup my google account in chrome, and log onto gmail.. and sync bookmarks 
#i've made dis due to the bad grade i got in my os handin 2 so im changing my "game" a bit with a new twist .. and going all linux
