#!/bin/sh
# export GDK_SCALE=2
# export QT_AUTO_SCREEN_SCALE_FACTOR=2
xrdb -merge ~/.Xresources
# thunar --daemon &
# stalonetray &
# dunst &
dropbox start &
sxhkd &
flameshot &
skypeforlinux &
# command -v cbatticon && cbatticon -l 20 -r 8 -c "/usr/bin/systemctl hibernate" &
command -v mpd && mpd

# localectl list-x11-keymap-variants
# setxkbmap -print -verbose 10

# example commands i put in a .machinerc. I keep the .machinerc
# specific to the machine I am running it on.
# setxkbmap -model pc105 -layout us -variant altgr-intl -option ctrl:swapcaps -option compose:sclk
[ -f ~/.machinerc ] && source ~/.machinerc

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# exec ssh-agent xmonad
exec ssh-agent startxfce4

# export GDK_BACKEND=x11
# exec ssh-agent gnome-session
