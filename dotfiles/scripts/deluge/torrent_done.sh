#! /bin/sh
#
# torrend_done.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#

torrentid=$1
torrentname=$2
torrentpath=$3

notify-send "Download de '$2' finalizado"
