#!/bin/sh

file=$(filer.sh "$HOME/Pictures/Screenshots" screenshot png)

scrot "$file"
