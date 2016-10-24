#!/bin/sh
show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Minimal Server ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Minimal Desktop ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Full Server ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4)${MENU} Full Desktop ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    read opt
}
option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then
            exit;
    else
        case $opt in

         1) clear;
        option_picked "Option 1 Picked";
        sudo ./script/mserver.sh;
        menu;
        ;;

        2) clear;
        option_picked "Option 2 Picked";
        sudo ./script/mdesktop.sh;
        menu;
        ;;

        3) clear;
        option_picked "Option 3 Picked";
        sudo ./scripts/fserver.sh;
        show_menu;
        ;;

        4) clear;
        option_picked "Option 4 Picked";
        sudo ./scripts/fdesktop.sh;
        show_menu;
        ;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done
