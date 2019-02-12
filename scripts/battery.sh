BATTINFO=`acpi -b`
if [[ `echo $BATTINFO | grep Discharging` && `echo $BATTINFO | cut -f 5 -d " "` <= 00:50:00 ]] ; then 
        notify-send -t 3600 -u critical "HELVETTE!!!" "Power is running low  $(acpi -b | cut -f 4 -d " ") "
fi
