#! /bin/sh
#
# blur.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#

inp="$1"
out="$2"

convert "$inp" -blur 0x5 "$out"
