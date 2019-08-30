#!/bin/bash

MUSIC_ROOT="$HOME/Music/"
NO_PIC="$HOME/Pictures/.no-pic.png"

function findpic() {
	current_dir=$(mpc current -f %file%) # Get current file
	current_dir=$MUSIC_ROOT$current_dir # Music path relative to filesystem 
	current_dir=${current_dir%/*} # Remove the file from the path

	file=$(find "$current_dir" | grep -Ei "\.(jpg|jpeg|png|bmp)"  | sort | head -n 1) # Get the fisrt image we find

	if  [[ -z $file  ]] # If we didn't find a file...
	then
		file=$NO_PIC
	fi
}

pingo() {
	curl localhost:6969/setImage --data-urlencode  image="$file" || goview "$file"
}


while true; do

	lastSong=$currSong
	currSong=$(mpc current)

	if [[ $lastSong != $currSong ]]; then
		findpic
		# pingo &
		notify-send -i "$file" -a 'Now Playing' " $(mpc current -f '%title%')" " $(mpc current -f '%artist%')" &
	fi

	mpc idle player
done
