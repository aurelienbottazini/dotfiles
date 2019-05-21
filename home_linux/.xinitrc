setxkbmap -option ctrl:swapcaps
dropbox start &
hp-systray &
sxhkd &
flameshot &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec ssh-agent startxfce4
