#!/bin/bash

# ------------------------------------------ #
# Cycles through US and BR  keyboard layouts #
# ------------------------------------------ #

OUTPUT=$(setxkbmap -query | grep layout | grep -o ":.*" | tr -d ":, ")
LAYOUTS=("br" "us")

if [ $OUTPUT = "br" ]; then
  setxkbmap us
elif [ $OUTPUT = "us" ]; then
  setxkbmap br
else
  setxkbmap us
fi
