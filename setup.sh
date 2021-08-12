#!/usr/bin/env sh

restow() {
  ls -F | grep / | xargs stow $1 -vRt "$HOME"
}

ask_confirmation() {
  echo -n "\n-> Make changes to filesystem? (Y/n): "
  read answer

  if echo "$answer" | grep [Yy]; then
    echo "Stowing packages..."
  else
    echo "Canceled"
    exit 0
  fi
}

main() {
  restow --simulate
  ask_confirmation
  restow

  echo "Finished stowing packages..."
  exit 0
}

main
