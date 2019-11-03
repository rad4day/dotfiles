#!/bin/bash

if [[ $# != 1 ]] || [[ ! -e "$1" ]]; then
    echo "usage: $0 folder"
fi

if [[ -f "$1" ]]; then
    xdg-open "$1" &
    exit 0
fi

DIRS=$(find -L "$1" -mindepth 1 -maxdepth 1 -type d | rev | cut -d "/" -f1 | rev)
FILES=$(find -L "$1" -mindepth 1 -maxdepth 1 -type f| rev | cut -d "/" -f1 | rev)

echo "$DIRS$FILES" | dmenu | xargs -I"{}" $0 "$1/{}"
