#!/bin/sh

# Script to 'compile' rice configs

for i in {0..15}; do
	c=$(xrdb -query | grep "*color$i:")
	c=${c#*#}
	color[$i]="#$c"
done

function buildDunst() {

	"$HOME/.scripts/util/replacer/replacer.sh" "$HOME/.config/dunst/dunstrc.template"
	
	killall dunst
	i3-msg exec dunst
}

function buildHomePage() {
	"$HOME/.scripts/util/replacer/replacer.sh" "$HOME/.config/dunst/dunstrc.template"
}

function buildXresources() {
	cp "$HOME/.cache/wal/colors.Xresources" "$HOME/.Xresources"

	cat "$HOME/.Xresources.template">> "$HOME/.Xresources"

	xrdb "$HOME/.Xresources"
}

function buildSteam() {
	wal_steam.py
}

function buildCava() {
	"$HOME/.scripts/util/replacer/replacer.sh" "$HOME/.config/cava/config.template"
}

function buildPrismaCss() {
	"$HOME/.scripts/util/replacer/replacer.sh" "$HOME/Projects/css/Prisma.css.template"
}

function buildQuteBrowser() {
	"$HOME/.scripts/util/replacer/replacer.sh" "$HOME/.config/qutebrowser/config.py.template"
}

buildDunst
buildHomePage
buildXresources
buildSteam
buildCava
buildPrismaCss
buildQuteBrowser

notify-send "Rice completed!"
