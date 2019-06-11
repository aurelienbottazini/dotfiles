#!/bin/sh

CURRENT_KEYMAP_VARIANT=$(setxkbmap -print -verbose 10 | awk '/variant:/ { print $ 2 }')
NEW_KEYMAP_VARIANT=''
NEW_KEYMAP_NAME=''

if [ "$CURRENT_KEYMAP_VARIANT" = "" ];
then
   NEW_KEYMAP_VARIANT="altgr-intl"
   NEW_KEYMAP_NAME='altgr-intl'
else
   NEW_KEYMAP_VARIANT=""
   NEW_KEYMAP_NAME='us generic'
fi

setxkbmap -variant "$NEW_KEYMAP_VARIANT"
echo "$NEW_KEYMAP_VARIANT" | while read OUTPUT; do notify-send "Switched to $NEW_KEYMAP_NAME layout"; done
