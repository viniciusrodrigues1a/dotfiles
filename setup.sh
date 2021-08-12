#!/usr/bin/env sh

restow() {
  for f in *; do
    if [ -d "$f" ]; then
      echo "\n$f\n"
      stow -vRt "$HOME" "$f" $1
    fi
  done

  echo -n "\n"
}

ask_confirmation() {
  echo -n "-> Make changes to filesystem? (Y/n): "
  read answer

  if echo "$answer" | grep [Yy]; then
    echo "Stowing packages..."
  else
    echo "Canceled"
    exit 0
  fi
}

main() {
  restow -n
  ask_confirmation
  restow

  echo "Finished stowing packages..."
  exit 0
}

main
