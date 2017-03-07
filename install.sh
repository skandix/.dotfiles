#/bin/sh
# Refreshing Repo's
user="skandix"
apt-get update
apt-get install zsh curl -y

# Installing the Packages i need
apt-get install cmus mpv awesome xbacklight xorg screen pulseaudio pavucontrol bmon vim tmux nload macchanger make python-dev python-pip chromium wicd-curses alsa-utils ipcalc rxvt-unicode-256color iptraf iwconfig  -y 

# Spotify Client for Linux
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C1988
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install spotify-client

#Sublime Text 3 x64
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
dpkg -i sublime-text_build-3083_amd64.deb 

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
echo "chown whoami ~/.config/awesome/rc.lua"
#install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp dotfiles/lambda.zsh-theme /home/$user/.oh-my-zsh/themes/
cp dotfiles/.zshrc /home/$user/
