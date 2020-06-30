#!/usr/bin/env bash

read -p "Are we Streaming ? y/n " option
echo
case "$option" in
	y|Y ) echo "Yes";
		pactl load-module module-null-sink sink_name=streamSink;
		pactl load-module module-loopback source=streamSink.monitor sink=alsa_output.usb-PreSonus_Studio_24c_SC1E19060186-00.analog-stereo;;

	n|N ) echo "No";
		pactl unload-module module-null-sink;;
    # and remember to delete the other outputs that is not in use
	*) echo "Not a valid command!"
esac
echo
