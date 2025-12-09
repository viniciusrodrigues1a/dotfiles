#!/bin/bash

# Get the volume and mute status
VOLUME=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
IS_MUTED=$(echo "$VOLUME" | grep -c MUTED)

if [ "$IS_MUTED" -eq 1 ]; then
  echo "{\"text\": \"\uf6a9\", \"tooltip\": \"Muted\"}"
else
  PERCENT=$(echo "$VOLUME" | awk '{print int($2 * 100)}')

  # Optional: Adjust icon depending on volume level
  if [ "$PERCENT" -lt 30 ]; then
    ICON="\uf026"
  elif [ "$PERCENT" -lt 70 ]; then
    ICON="\uf027"
  else
    ICON="\uf028"
  fi

  echo "{\"text\": \"$ICON $PERCENT%\", \"tooltip\": \"$PERCENT%\"}"
fi

