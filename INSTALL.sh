#!/usr/bin/env sh

# PKGS
base="alacritty pfetch dunst feh moc youtube-dl picom-git rofi tmux newsboat xorg xorg-xinit xorg-server gnome-keyring xsecurelock xscreensaver xscreensaver-aerial"
docker="docker docker-compose"
fonts="nerd-fonts-fira-code noto-fonts-emoji"
#nvidia=" nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader" # feelsshart man
nvidia="nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader" 
games="lutris wine-staging minecraft-launcher multimc5 steam"
k8s="kubectl lens"
nfc_tools="mfoc-git mfcuk-git"
network_manager="network-manager-applet networkmanager networkmanager-openvpn"
obs_studio="obs-studio-git obs-linuxbrowser"
pulseaudio="pulseaudio blueman bluez bluez-utils pamixer pasystray"
cli="zip unzip unrar p7zip screen go jq wget git ncdu termdown htop xclip minicom ffmpeg keybase mkdocs mkdocs-material-pymdownx-extras mkdocs-material openvpn pywal-git"
ctf_tools="ghidra-darcula sonic-visualiser volatility hexedit strace ltrace msitools"
gui="slack-desktop discord telegram-desktop-bin teams signal-desktop-beta zoom spotify plex-media-player mpv firefox-extension-bitwarden firefox torbrowser-launcher obsidian visual-studio-code-bin sublime-text-4 pavucontrol peek flameshot i3-wm i3blocks arandr "
net_tools="traceroute nmap wireshark-qt tcpdump speedtest-cli gnu-netcat"
python="neovim python-pip python-pipenv binwalk"

enable_multilib(){
    echo "nononono"
}

pre_req() {
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si

    # Blackarch stuff
    #curl -O https://blackarch.org/strap.sh
    #echo edf8a85057ea49dce21eea429eb270535f3c5f9a strap.sh | sha1sum -c
    #chmod +x strap.sh
    #sudo ./strap.sh
}


TheOrville(){
    pre_req
    yay -S $base
    yay -S $docker
    yay -S $fonts
    yay -S $nvidia
    yay -S $games
    yay -S $k8s
    yay -S $network_manager
    yay -S $obs_studio
    yay -S $cli
    yay -S $ctf_tools
    yay -S $gui
    yay -S $net_tools
    yay -S $python
}

# MAIN
TheOrville
