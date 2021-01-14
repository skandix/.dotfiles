#/usr/bin/env bash
course=$(rofi -dmenu -p "Course To Watch" -lines 0)
stream_url="https://live.uia.no/live/ngrp:"$course"_all/playlist.m3u8"
#echo $stream_url
mpv $stream_url &
