#/usr/bin/env bash
SCRIPT="/usr/bin/uiaSearch.py"
PERSON=$(rofi -dmenu -p "Who are you loooking for ?" -lines 0)
$($SCRIPT -s "$PERSON" | rofi -dmenu)