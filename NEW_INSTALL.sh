#!/bin/sh
main_menu(){
    NORMAL=`echo "\033[m"`
    NUMBER=`echo "\033[33m"` #yellow

    echo "${MENU}${NUMBER} 1)${MENU} dotfiles ${NORMAL}"
    echo "${MENU}${NUMBER} 2)${MENU} progams ${NORMAL}"
    echo "${MENU}${NUMBER} 3)${MENU} misc ${NORMAL}"
    read opt
}

dotfiles_menu(){
    NORMAL=`echo "\033[m"`
    NUMBER=`echo "\033[33m"` #yellow

    echo "${MENU}${NUMBER} 1)${MENU} dotfiles ${NORMAL}"
    echo "${MENU}${NUMBER} 2)${MENU} progams ${NORMAL}"
    echo "${MENU}${NUMBER} 3)${MENU} misc ${NORMAL}"
    read opt
}


clear
main_menu
case $opt in

1) clear;
    echo "Option 1 Picked";
    main_menu;
    ;;

2) clear;
    echo "Option 2 Picked";
    main_menu;
    ;;

3) clear;
    echo "Option 3 Picked";
    main_menu;
    ;;

4) clear;
    echo "Option 4 Picked";
    main_menu;
    ;;

\n)clear;
	echo "Pick an option from the menu";
	main_menu;
	;;
esac
