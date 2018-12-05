#!/bin/bash

[ $(echo -e "No\nYes" | dmenu -fn "Gotham HTF Black:size=13" -nb "#fccf61" -nf "#000000" -sb "#f79b2f" -sf "#000000" -i -p "$1") == "Yes" ] && $2
