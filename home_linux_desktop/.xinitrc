export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit

#xrandr --dpi 186
#export QT_AUTO_SCREEN_SCALE_FACTOR=2
#export GDK_SCALE=2
#export ELM_SCALE=2


setxkbmap -option compose:sclk
#wmname LG3D

dropbox start &
hp-systray &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec ssh-agent startxfce4
# exec ssh-agent startkde
# stalonetray &
#exec ssh-agent xmonad
