#!/bin/bash
# note: st will crash if you have an emoji font with colors installed.
# Use: ttf-symbola with has outlined emojis.
# st -g 200x80 -c main-terminal
tilix --class main-terminal --new-process --geometry 90x100+0+0
