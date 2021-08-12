#!/usr/bin/env sh

DIR="$HOME/.config/polybar"
FDIR="$HOME/.local/share/fonts"

setup_fonts() {
    if [ ! -d "$FDIR" ]; then
        mkdir -p "$FDIR"
    fi

    if [ ! -f "$FDIR/feather.ttf" ]; then
        cp -r $DIR/fonts/feather.ttf "$FDIR"
    fi
}

kill_running_processes() {
    killall -q polybar;
}

run_polybar() {
    polybar -q main -c "$DIR"/config.ini &
}

main() {
    setup_fonts
    kill_running_processes
    run_polybar
}

main
