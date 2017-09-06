#!/bin/bash

button_left="%{A:"
button_right="%{A}"

button() {
    button="${button_left}"
    button="${button}$1:}"
    button="${button}$2"
    button="${button}${button_right}"
    echo -e $button
}

# battery

BCAP=/sys/class/power_supply/BAT0/capacity
BSTT=/sys/class/power_supply/BAT0/status

get_battery() {
    if [[ $(cat $BSTT) = "Charging" || $(cat $BSTT) = "Full" ]]; then
        echo -e "\uf1e6 "
    fi
    n=$(cat $BCAP)
    echo "$n% "
    if (($n>=96 && $n<=100)); then
        echo -e "\uf240  "
    elif (($n>=66 && $n<=95)); then
        echo -e "\uf241  "
    elif (($n>=36 && $n<=65)); then
        echo -e "\uf242  "
    elif (($n>=6 && $n<=35)); then
        echo -e "\uf243  "
    elif (($n>=0 && $n<=5)); then
        echo -e "\uf244  "
    fi
}

# network

get_network_state() {
    # 0 = no signal
    # 1 = wire
    # 2 = wifi
    NETW=2
    case $NETW in
        0) echo -e "\uf00d "
            ;;
        1) echo -e "\uf012 "
            ;;
        2) echo -e "\uf1eb "
            ;;
        *) echo -e "\uf00d " ;;
    esac
}

# date

get_time() {
    date '+%Y-%m-%d %H:%M'
}

# sound

sound_button() {
    MUTED=false
    if [[ $MUTED ]]; then
        button "0%" "\uf028"
    else
        button "100%" "\uf026"
    fi
}

# i3 workspaces

get_current_workspace() {
    # add hook for ws change
    bash $HOME/.config/lemonbar/ws-icons.sh
}

# log/poweroff

power_button() {
    button "poweroff" "\uf011"
}

# update
get_updates() {
    if [[ -n "$(checkupdates)" ]]; then
        echo -e "\033[31m"
    else
        echo -e "\033[32m"
    fi
    echo -e "$button_left update:}\uf021\033[0m$button_right"
}

# get it all

# This loop will fill a buffer with our infos, and output it to stdout.
while :; do
    buf=""
    buf="${buf} $(get_current_workspace)   --  "
    buf="${buf} $(get_network_state)   --  "
    buf="${buf} $(get_updates)   --  "
    buf="${buf} $(get_battery)   --  "
    buf="${buf} $(get_time)   --  "
    buf="${buf} $(power_button)"

    echo $buf >> /dev/pts/0
    sleep 1 # The HUD will be updated every second
done
