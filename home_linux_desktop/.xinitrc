feh --bg-max --randomize ~/Dropbox/Pictures/wallpaper/ps21_16x20.jpg
xrandr --dpi 183
flameshot >/dev/null 2>&1&
export _JAVA_AWT_WM_NONREPARENTING=1
export AWT_TOOLKIT=MToolkit
wmname LG3D
setxkbmap -option compose:sclk
stalonetray &
jetbrains-toolbox &
dropbox &
dunst -config ~/.config/dunst/dunstrc &
exec xmonad
