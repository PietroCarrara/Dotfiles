#!/bin/bash

for file in "$@"; do
	filename=$(basename "$file")
	filenameNoExt=${filename%.*}

	mkdir "$filenameNoExt"
	cd "$filenameNoExt"

	7z x "../$filename"

	cd ..
done 
