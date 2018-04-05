#!/usr/bin/env bash

function run {
	if ! pgrep $1 ;
	then
		$@&
	fi
}
run compton
run kwalletd5
run xscreensaver -nosplash
nitrogen --restore &

# Programms
run nextcloud
#run telegram-desktop
#run discord
#run thunderbird
