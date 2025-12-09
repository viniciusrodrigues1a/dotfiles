#!/usr/bin/env bash

CURRENT_LAYOUT=$(setxkbmap -query | grep "layout" | tr -d " " | cut -d ":" -f 2)

echo $CURRENT_LAYOUT
if [ "$CURRENT_LAYOUT" = "us" ]; then
	setxkbmap br
    notify-send -r 909090 "Keyboard Layout" "🇧🇷 BR"
else
	setxkbmap us
    notify-send -r 909090 "Keyboard Layout" "🇺🇸 US"
fi
