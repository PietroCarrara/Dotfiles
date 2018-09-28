#!/bin/sh

if [ -z "$1" ]; then
	file=$(find "$HOME/Pictures/Wallpapers" -type f | shuf -n 1)
else
	file=$1
fi

fit.sh "$file" "png:$HOME/Pictures/.wallpaper"
blur.sh "$HOME/Pictures/.wallpaper" "png:$HOME/Pictures/.lock"

feh --bg-fill "$file"

wal -i "$file" -g -a 100

rice.sh
