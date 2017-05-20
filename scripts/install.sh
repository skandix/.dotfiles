#!/bin/bash
#echo "Remember to add contrib and non-free to source list "

echo -n $'\e[35m'
echo $'______      _                                       '
echo $'|  _  \    | |                                      '
echo $'| | | |__ _| |_ __ _ _ __   ___  _ __   ____   ___  '
echo $'| | | / _  | __/ _` |  _ \ / _ \|  __| |  _ \ / _ \ '
echo $'| |/ / (_| | || (_| | |_) | (_) | | _  | | | | (_) |'
echo $'|___/ \__,_|\__\__,_| .__/ \___/|_|(_) |_| |_|\___/ '
echo $'                    | |                             '
echo $'                    |_|                             '
echo ""


echo -n $'\E[39m'
user="skandix"
apt-get update && apt-get install sudo -y
echo "adding $user to sudoers list"
adduser $user 
adduser $user sudo
echo ""
PS3=" Want to install Awesome & xorg?: "
pick=("Yes" "No")
select opt in "${pick[@]}"
do
  case $opt in
	"Yes")
	apt-get install awesome xorg -y
	;;
	"No")
	break
	;;
	*) echo helvette;
  esac
done

#all_files()
#{
#  echo "linking ...files"
#  for i in $(ls -a ../files)
#    do
#      select gopt in "$i"       
#    done

# for y in ls_dir
 #   ln -s ls_dir $/home/
#}

#specify()
#{
#echo specify
# for x in ls dir_dotfiles
# print x 
# 
#}

echo ""
echo ""
PS3="laptop or workstation: "
pick=("laptop" "workstation" "server" "skip")
select opt in "${pick[@]}"
do
  case $opt in
        "laptop") 
        apt-get install git mpv xbacklight screen pulseaudio pavucontrol tmux python-dev python-pip chromium wicd-curses alsa-utils rxvt-unicode-256color firmware-iwlwifi zsh moc -y 
        ;;
        "workstation") 
        apt-get install git mpv screen pulseaudio pavucontrol tmux python-dev python-pip chromium alsa-utils rxvt-unicode-256color zsh -y 
        ;;
	"server")
	apt-get install screen tmux python-dev python-pip virtualenvwrapper virtualenv zsh vim vim-python-jedi vim-youcompleteme -y
	;;
        "skip")
        break
        ;;
        *) echo helvette;
  esac
done


echo ""
echo ""
PS3="specify dotfiles: "
pick=("all" "specify" "skip") 
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
	"skip")
	break
	;;
        *) echo helvette;
  esac
done


echo ""
echo ""
PS3="Want to install/update Spotify ?"
pick=("install" "update" "skip")
select opt in "${pick[@]}"
do 
    case $opt in
	"install")
	$(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+')
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	apt-get update && apt-get install spotify-client -y
	;;
	"update")
	$(wget -qO- https://www.spotify.com/no/download/linux | egrep 'recv-keys\s\w+')
	apt-get update && apt-get install spotify-client -y
	;;
	"skip")
	break
	;;
	*) echo helvette;
  esac
done

echo ""
echo ""
PS3="stop the fucking beeping"
pick=("stopit!" "skip")
select opt in "${pick[@]}"
do
   case $opt in
	"stopit!") 
	modprobe -r pcspkr
	echo "# Do not load 'pcspkr' module on boot "\n "#blacklist pcspkr" | sudo tee -a /etc/modprobe.d/nobeep.conf
	;;
	"skip")
	break
	;;
	*) echo helvette;
  esac
done


