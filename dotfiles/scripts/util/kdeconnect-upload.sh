#! /bin/sh
#
# kdeconnect-upload.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#

# Uploads a file to the first found device
# Usage: kdeconnect-upload.sh <filename>

id=$(kdeconnect-cli -a --id-only)

# Is directory
if [[ -d "$1" ]]; then
	for file in "$1"*.*; do
		notify-send "kdeconnect" "Sending $file..."
		kdeconnect-cli --share "$1" -d "$id"
		read nothing
	done
# Is file
else
	notify-send "kdeconnect" "Sending $1..."
	kdeconnect-cli --share "$1" -d "$id"
fi

