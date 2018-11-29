#!/bin/bash
read -p "$(printf 'What Debian Flavor do you want ?\n1: Stretch (Stable)\n2: Buster (Testing)\n3: Sid (Unstable)\n4: Roll backup\n\b')" option
echo
case "$option" in
    1 ) echo "Stretch (Stable)";
        cd /etc/apt/;
        sudo cp sources.list sources.list.bak;
        echo -e "# Debian Stretch (Stable)\ndeb http://ftp.no.debian.org/debian/ stretch main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ stretch main contrib non-free\n\ndeb http://ftp.no.debian.org/debian/ stretch-updates main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ stretch-updates main contrib non-free\n\ndeb http://security.debian.org/ stretch/updates main contrib non-free\ndeb-src http://security.debian.org/ stretch/updates main contrib non-free\n" | sudo tee sources.list;;
    2 ) echo "Buster (Testing)";
        cd /etc/apt/;
        sudo cp sources.list sources.list.bak;
        echo -e "###### Debian Buster (Testing)\ndeb http://ftp.no.debian.org/debian/ buster main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ buster main contrib non-free\n\ndeb http://ftp.no.debian.org/debian/ buster-updates main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ buster-updates main contrib non-free\n\ndeb http://security.debian.org/ buster/updates main contrib non-free\ndeb-src http://security.debian.org/ buster/updates main contrib non-free\n" | sudo tee sources.list;;
   3 ) echo -e "Sid (Unstable)";
       cd /etc/apt/;
       sudo cp sources.list sources.list.bak;
       echo -e "###### Debian Main Repos\ndeb http://ftp.no.debian.org/debian/ testing main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ testing main contrib non-free\n\ndeb http://ftp.no.debian.org/debian/ testing-updates main contrib non-free\ndeb-src http://ftp.no.debian.org/debian/ testing-updates main contrib non-free\n\ndeb http://security.debian.org/ testing/updates main contrib non-free\ndeb-src http://security.debian.org/ testing/updates main contrib non-free\n" | sudo tee sources.list;;
    4 ) echo "Roll backup";
        cd /etc/apt/;
        sudo cp sources.list.bak sources.list -fv;;
    y|Y) echo "Yes";
        for dotconfig in $confsDetect; do
            ln -svf $confs$dotconfig ~/.config/$dotconfig 2>/dev/null
        done;;
    n|N ) echo "No";;
esac
echo
