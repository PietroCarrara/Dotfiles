#!/bin/sh

tmp_file=/tmp/scrot-$RANDOM.png

scrot "$tmp_file"

file=$(filer.sh "$HOME/Pictures/Screenshots" screenshot png)

mv "$tmp_file" "$file"

notify-send -i "$file" 'Smile!' "Screenshot saved!"
