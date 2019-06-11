#!/bin/sh
export GDK_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=2
xrdb -merge ~/.Xresources
thunar --daemon &
stalonetray &
dunst &
dropbox start &
sxhkd &
flameshot &
jetbrains-toolbox &
skypeforlinux &
command -v cbatticon && cbatticon -l 20 -r 8 -c "/usr/bin/systemctl hibernate" &

# localectl list-x11-keymap-variants
# setxkbmap -print -verbose 10

# example commands i put in a .machinerc. I keep the .machinerc
# setxkbmap -model pc105 -layout us -variant altgr-intl -option ctrl:swapcaps
# specific to the machine I am running it on.
[ -f ~/.machinerc ] && source ~/.machinerc

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

exec ssh-agent xmonad
