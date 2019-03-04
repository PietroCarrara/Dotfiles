#!/bin/sh

# List of processes to be killed and restarted
list=(
	dunst
	wal_steam
)

for i in "${list[@]}"; do
	killall "$i";
	i3-msg 'exec --no-startup-id' "$i";
done

notify-send "Rice completed!"
