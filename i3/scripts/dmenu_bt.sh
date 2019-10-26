#!/bin/bash

declare -a menu
declare -A commands
export POWERED=0

if bluetoothctl show | grep "Powered: yes"; then
    menu+=("power off")
    commands["power off"]="bluetoothctl power off"
    # menu+=("Scan for new devices")
    # commands["Scan for new devices"]="bluetoothctl scan on"
    POWERED=1
else
    menu+=("power on")
    commands["power on"]="bluetoothctl power on"
fi

if [ $POWERED -eq 1 ]; then
    IFS=$'\n'
    for i in $(bluetoothctl paired-devices); do
        # echo $i
        if bluetoothctl info $(echo "$i" | cut -d" " -f2) | grep "Connected: yes"; then
            TEXT="Disconnect from $(echo "$i" | cut -d" " -f3)"
            CMD="bluetoothctl disconnect $(echo "$i" | cut -d" " -f2)"
        else
            TEXT="Connect to $(echo "$i" | cut -d" " -f3)"
            CMD="bluetoothctl connect $(echo "$i" | cut -d" " -f2)"
        fi
            menu+=("$TEXT")
            commands["$TEXT"]="$CMD"
    done
fi

RETVAL=$(for index in "${!menu[@]}"; do echo "${menu[$index]}"; done | dmenu -l 5 -p "Bluetooth")
if [ $? ]; then
    RETCMD=${commands["$RETVAL"]}
    echo $RETCMD | bash
fi
