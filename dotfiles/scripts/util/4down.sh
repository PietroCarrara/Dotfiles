#! /bin/sh
#
# img-down.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#

Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Brown='\033[0;33m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
LightGray='\033[0;37m'
Clear='\033[0m'

silentcurl() {
	curl "$@" 2> /dev/null
}

link=$1

if [[ ! $link ]]; then
	echo "You must provide a thread link."
	exit 1
fi

# Separate words by '/'
IFS="/"

# Segments of provided url
arr=($1)

board=${arr[3]}
id=${arr[5]}

unset IFS

json=$(silentcurl "https://a.4cdn.org/$board/thread/$id.json")

title=$(echo $json | jq ' .posts[0].sub' -r)

imgs=($(echo $json | jq ' .posts | .[] | select(.tim != null) | (.tim|tostring) + .ext' -r))
len=${#imgs[@]}

echo -e "Found ${Red}$len${Clear} files"

i=1
for img in ${imgs[@]}; do
	echo -en "\e[0K\rDownloading files from ${Blue}$title${Clear} ($i/$len)"
	silentcurl "https://i.4cdn.org/$board/$img" > $img
	i=$(( i + 1 ))
done
