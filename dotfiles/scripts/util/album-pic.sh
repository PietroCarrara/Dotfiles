#!/bin/sh

MUSIC_ROOT="$HOME/Music/"
NO_PIC="$HOME/Pictures/.no-pic.png"

echo $MUSIC_ROOT

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
	curl localhost:6969/setImage -d image="$file" || goview "$file"
}

{
	findpic

	pingo &

	notify-send -i "$file" "Now Playing:" "$(mpc current -f '%artist% - %title%')" &
} &> /dev/null
