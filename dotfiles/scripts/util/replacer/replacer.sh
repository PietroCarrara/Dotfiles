#! /bin/sh

colors=""

for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; do
	c=$(xrdb -query | grep "*color$i:")
	c=${c#*#}
	colors="$colors color$i=$c"
done

/home/pietro/.scripts/util/replacer/replacer "$1" $colors
