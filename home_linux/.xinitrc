export GDK_SCALE=2
export QT_AUTO_SCREEN_SCALE_FACTOR=2
stalonetray &
dropbox start &
sxhkd &
flameshot &
jetbrains-toolbox &
skype-for-linux &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
/* exec ssh-agent startxfce4 */
exec ssh-agent xmonad
