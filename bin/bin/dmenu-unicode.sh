#!/bin/sh
# Give dmenu list of all unicode characters to copy.
# Shows the selected character in dunst if running.

# Must have xclip installed to even show menu.
xclip -h >/dev/null || exit

chosen=$(grep -v "#" ~/.emoji | rofi -dmenu -p "emoji" -i -l 20 -fn Monospace-18)

[ "$chosen" != "" ] || exit

c=$(echo "$chosen" | sed "s/ .*//")
echo "$c" | tr -d '\n' | xclip -selection clipboard
notify-send "'$c' copied to clipboard." &

s=$(echo "$chosen" | sed "s/.*; //" | awk '{print $1}')
echo "$s" | tr -d '\n' | xclip
notify-send "'$s' copied to primary." &
