#!/bin/bash
BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` < 00:50:00 ]] ; then 
  rofi -e "YOU ONLY GOT $(acpi -b | cut -f 4 -d " ") left of juice, please insert the charger..ASAP"
fi
