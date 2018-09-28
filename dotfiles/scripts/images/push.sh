#! /bin/sh
#
# push.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
# 
# Pushes the image down X pixels, filling the space with black
#
# Distributed under terms of the MIT license.
#

inp="$1"
x="$2"
out="$3"

convert "$inp" -resize '1366x768^' - | convert - -splice 0x"$x" -gravity north -extent 1366x768 "$out"
