#!/usr/bin/env sh
# amixer sget Master,0 | grep Mono: | cut -d [ -f2|cut -d % -f1
pulseaudio-rofi.sh --output_volume
