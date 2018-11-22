#!/bin/sh
xrandr --dpi 183 --output HDMI-2 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-3 --mode 1920x1080 --pos 3840x0 --rotate normal --panning 3840x2160+3840+0 --scale 2x2

# vertical screen
# xrandr --fb 6000x6000 --dpi 183 --output HDMI-2 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output HDMI-3 --mode 1920x1080 --pos 3840x0 --scale 2x2 --rotate right --panning 2160x3840+3840+0

# xmonad --restart
