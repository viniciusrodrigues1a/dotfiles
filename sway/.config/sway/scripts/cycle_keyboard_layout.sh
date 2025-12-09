#!/bin/bash

# ------------------------------------------ #
# Cycles through US and BR keyboard layouts  #
# and sends a desktop notification           #
# For use with Wayland and SwayWM            #
# ------------------------------------------ #

# Get the current layout using swaymsg
CURRENT_LAYOUT=$(swaymsg -t get_inputs | jq -r '
  .[] | select(.type == "keyboard") | .xkb_active_layout_name' | head -n 1)

# Switch layout and send notification
if [ "$CURRENT_LAYOUT" = "English (US)" ]; then
  swaymsg input "*" xkb_layout br
  notify-send "Keyboard Layout" "🇧🇷 BR"
elif [ "$CURRENT_LAYOUT" = "Portuguese (Brazil)" ]; then
  swaymsg input "*" xkb_layout us
  notify-send "Keyboard Layout" "🇺🇸 US"
else
  swaymsg input "*" xkb_layout us
  notify-send "Keyboard Layout" "🇺🇸 US"
fi
