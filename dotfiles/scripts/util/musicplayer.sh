#! /bin/sh
#
# musicplayer.sh
# Copyright (C) 2018 pietro <pietro@the-arch>
#
# Distributed under terms of the MIT license.
#

i3-msg 'workspace 10:X; append_layout ~/.config/i3/music.json'

urxvtc -T mp-ncmpcpp -e ncmpcpp &
urxvtc -T cava -e cava &
