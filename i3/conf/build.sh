#!/bin/bash
rm ~/.dotfiles/i3/config
cat ~/.dotfiles/i3/conf/client/$(hostname)/head ~/.dotfiles/i3/conf/common/base > ~/.dotfiles/i3/config
