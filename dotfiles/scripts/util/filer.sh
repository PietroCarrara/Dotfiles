#!/bin/bash

# Script for finding the first available filename in a folder

folder=$1

filename=$2

extension=$3

for i in {1..9999}; do
	if [ ! -e "$folder/$filename $i.$extension" ]; then
		echo "$folder/$filename $i.$extension"
		exit 0
	fi
done

