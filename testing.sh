# implement this as well here https://wiki.debian.org/UnattendedUpgrades

# set debian flavor
read -p "What Debian Flavor do you want ? 1: Jessie (Oldstable), 2: Stretch (Stable), 3:Buster (Testing), 4:Sid (Unstable), 5: Roll backup" option
echo  
case "$option" in
    1 ) echo "Jessie (Oldstable)"; cd /etc/apt/; sudo cp sources.list sources.list.bak; echo "# Debian Jessie (Oldstable)\ndeb http://deb.debian.org/debian/ oldstable main contrib non-free\n#Security\ndeb http://deb.debian.org/debian-security oldstable/updates main\n" | sudo tee sources.list;; 
    2 ) echo "Stretch (Stable)"; cd /etc/apt/; sudo cp sources.list sources.list.bak; echo "# Debian Stretch (Stable)\ndeb http://deb.debian.org/debian/ stable main contrib non-free\ndeb-src http://deb.debian.org/debian/ stable main contrib non-free\n# Security\ndeb http://deb.debian.org/debian-security stable/updates main\ndeb-src http://deb.debian.org/debian-security stable/updates main\n" | sudo tee sources.list;;
    3 ) echo "Buster (Testing)"; cd /etc/apt/; sudo cp sources.list sources.list.bak; echo "###### Debian Buster (Testing)\ndeb http://deb.debian.org/debian/ testing main contrib non-free\ndeb-src http://deb.debian.org/debian/ testing main contrib non-free\n# Security\ndeb http://deb.debian.org/debian-security testing/updates main\ndeb-src http://deb.debian.org/debian-security testing/updates main\n" | sudo tee sources.list;;
    4 ) echo "Sid (Unstable)"; cd /etc/apt/; sudo cp sources.list sources.list.bak;  echo "###### Debian Main Repos\ndeb http://deb.debian.org/debian/ oldstable main contrib non-free\ndeb http://deb.debian.org/debian-security oldstable/updates main\n" | sudo tee sources.list;;
    5 ) echo "Roll backup"; cd /etc/apt/; sudo cp sources.list.bak sources.list -fv;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install Docker
read -p "Install Docker?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; cd /tmp && sudo apt update && sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - && sudo $(curl -s https://docs.docker.com/install/linux/docker-ce/debian/\#set-up-the-repository | egrep "(apt-key fingerprint ([0-9A-F]{8}))" | cut -d'>' -f 9) && sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && sudo apt update && sudo apt install docker-ce -y;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install gpu driver
read -p "What Packages ? 1: AMD, 2: NVIDIA, n/N " option
echo
case "$option" in
    1 ) echo "NVIDIA"; echo "# stretch-backports\ndeb http://httpredir.debian.org/debian stretch-backports main contrib non-free" | sudo tee -a && apt-get install linux-headers-$(uname -r|sed 's/[^-]*-[^-]*-//') && sudo apt update && apt install -t stretch-backports nvidia-driver ;;
    2 ) echo "AMD"; sudo apt update && sudo apt install firmware-amd-graphics;;
    n|N ) echo "No";;
    * ) echo "Invalid option";;
esac
echo

# install personal batch of script 
read -p "install skandix toolbox of somewhat working scripts ?  y/n " option
echo
case "$option" in
    y|Y ) echo "Install"; sudo cp scripts /opt/scripts && sudo chown $1:$1 /opt/scripts -R && echo "symlink and crontab you self, have to fix..." ;;
    n|N ) echo "No"; ;;
    * ) echo "Invalid option";;
esac
echo