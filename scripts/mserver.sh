#/bin/sh
# Refreshing Repo's
apt-get update
apt-get install zsh -y

#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Installing the Packages i need
apt-get install cmus screen bmon vim irssi curl tmux nload conky macchanger make python-dev python-pip ipcalc sudo iptraf -y 

apt-get update
apt-get install screenfetch -y
