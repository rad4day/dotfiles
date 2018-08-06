#!/bin/bash
COMMON=~/.dotfiles/i3/conf/common/
CLIENT=~/.dotfiles/i3/conf/client/$(hostname)/

if [ -f "~/.dotfiles/i3/config" ]; then
    rm ~/.dotfiles/i3/config
fi

if [ ! -d $CLIENT ]; then
    cp -r ~/.dotfiles/i3/conf/client/default ~/.dotfiles/i3/conf/client/$(hostname)
fi

cat ${CLIENT}header ${COMMON}base ${CLIENT}bar ${CLIENT}assignments ${COMMON}footer > ~/.dotfiles/i3/config
