#!/bin/sh
xrandr --dpi 183 --output HDMI-2 --primary --mode 3840x2160 --pos 3840x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-3 --off
xmonad --restart
