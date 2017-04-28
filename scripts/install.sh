#!/bin/bash
# Refreshing Repo's
user="skandix"

echo "Remember to add contrib and non-free to source list "

#apt-get update
#apt-get install awesome xorg sudo
#adduser $user sudo

all_files()
{
  echo "linking ...files"
  for i in $(ls -a ../files)
    do
      select gopt in "$i" 
      
    done

  # for y in ls_dir
  #   ln -s ls_dir $/home/

}

specify()
{
echo specify
# for x in ls dir_dotfiles
# print x 
# 
}


PS3="laptop or workstation: "
pick=("laptop" "workstation" "skip")
select opt in "${pick[@]}"
do
  case $opt in
        "laptop") 
        apt-get install git mpv xbacklight screen pulseaudio pavucontrol tmux python-dev python-pip chromium wicd-curses alsa-utils rxvt-unicode-256color firmware-iwlwifi zsh moc -y 
        ;;
        "workstation") 
        apt-get install git mpv screen pulseaudio pavucontrol tmux python-dev python-pip chromium alsa-utils rxvt-unicode-256color zsh -y 
        ;;
        "skip")
        break
        ;;
        *) echo helvette;
  esac
done

PS3="specify dotfiles: "
pick=("all" "specify")
select opt in "${pick[@]}"
do
  case $opt in
        "all")
          all_files
          #all_files()
          echo all
        ;;
        "specify")
          specify
          #echo specify
        ;;
          *) echo helvette;
  esac
done






#Spotify Client for Linux
#$(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+')
#echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
#apt-get update
#apt-get install spotify-client

# Stop BEEPING sound from internal speaker
#modprobe -r pcspkr
#echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf
