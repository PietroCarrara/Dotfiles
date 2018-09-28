#!/bin/bash

function connect() {
    xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output eDP-1 --primary --mode 1366x768 --pos 1920x0 --rotate normal       
}

function disconnect() {
    xrandr --output HDMI-1 --off --output DP-1 --off --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal
}

xrandr | grep "HDMI-1 connected" &> /dev/null && connect || disconnect

feh --bg-fill ~/Pictures/.wallpaper
