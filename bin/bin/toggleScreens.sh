#!/bin/sh

xrandr | grep HDMI-3 -A 1 | grep \*

case "$?" in
    "0")
	~/dotfiles/bin/bin/oneScreen.sh;;
    *)
	~/dotfiles/bin/bin/twoScreens.sh;;
esac
