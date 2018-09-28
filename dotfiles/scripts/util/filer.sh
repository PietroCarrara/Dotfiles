#!/bin/bash

# Script for finding the first available filename in a folder

folder=$1

filename=$2

extension=$3

num=1

while (find "$folder/$filename $num.$extension" &> /dev/null); do
    num=$[num+1]
done

echo "$folder/$filename $num.$extension"