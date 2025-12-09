#!/usr/bin/env bash
# ~/.local/bin/layout_macros.sh

# --- CONFIG ---
declare -A actions=(
    ["kill all"]="kill_all"
    ["quickcomex dbschenker debug"]="qcx_dbs"
)

# --- FUNCTIONS ---
kill_all() {
    i3-msg "[class=.*]" kill
}

qcx_dbs() {
    kill_all
    $(cd ~/www/@quickcomex/quickcomex-api && dbswip)
    $(cd ~/www/@quickcomex/quickcomex-client && dbswip)

    i3-msg "workspace number 1; exec kitty --hold --detach=yes -d ~/www/@quickcomex/quickcomex-client/ -e zsh -i -c "tmux new-session -d -s qc -n srv -c ~/www/@quickcomex/quickcomex-client \"zsh -i -c 'nvm use 16 && BROWSER=none yarn start dev'\"""
    # tmux new-window -t qc: -n src -c ~/www/@quickcomex/quickcomex-client \ "zsh -i -c 'vim .'"

    # tmux attach -t qc
}

# --- MENU ---
choice=$(printf "%s\n" "${!actions[@]}" | rofi -dmenu -p "Layout:")
[[ -z "$choice" ]] && exit
${actions[$choice]}

