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

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
/* exec ssh-agent startxfce4 */
exec ssh-agent xmonad
