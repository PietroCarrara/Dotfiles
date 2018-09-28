#!/bin/bash

if [ -z "$1" ]; then
	file=$(find ~/Pictures/Wallpapers -type f | shuf -n 1)
else
	file=$1
fi

fit.sh "$file" png:~/Pictures/.wallpaper
blur.sh ~/Pictures/.wallpaper png:~/Pictures/.lock

feh --bg-fill "$file"

wal -i "$file" -g -a 100

rice.sh
