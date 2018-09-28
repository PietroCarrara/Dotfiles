#! /bin/sh
#
# fit.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#


width=1366
height=768

inp="$1"
out="$2"

convert "$inp" -resize "$width"x"$height"^ -gravity center -extent "$width"x"$height" "$out"
