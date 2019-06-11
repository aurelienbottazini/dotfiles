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

# localectl list-x11-keymap-variants
# setxkbmap -print -verbose 10
setxkbmap -model pc105 -layout us -variant altgr-intl -option ctrl:swapcaps

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

command -v cbatticon && cbatticon -l 20 -r 8 -c "/usr/bin/systemctl hibernate" &

exec ssh-agent xmonad
