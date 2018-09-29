#! /bin/sh
#
# profile-switch.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#
# Switches between dotdrop profiles
#

profile=$(zenity --list --column="" --radiolist --column="Profile" x work x rice)

if [ -z $profile ]; then
	exit 1;
fi

cd $HOME/Projects/Dotfiles

dotdrop install -f -p $profile
