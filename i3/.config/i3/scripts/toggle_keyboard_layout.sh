#!/bin/bash

OUTPUT=$(setxkbmap -query | grep layout | grep -o ":.*," | tr -d ":, ")
LAYOUTS=("br" "us")

if [ $OUTPUT = "br" ]
then
  setxkbmap us,br
fi

if [ $OUTPUT = "us" ]
then
  setxkbmap br,us
fi
