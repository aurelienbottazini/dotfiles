#!/bin/sh

xrandr | grep HDMI-2 -A 1 | grep \*

case "$?" in
    "0")
	~/dotfiles/bin/oneScreen.sh;;
    *)
	~/dotfiles/bin/twoScreens.sh;;
esac
