#!/bin/zsh

typeset -A names
names[no]="global default"
names[fi]="normal file"
names[di]="directory"
names[ln]="symbolic link"
names[pi]="named pipe"
names[so]="socket"
names[do]="door"
names[bd]="block device"
names[cd]="character device"
names[or]="orphan symlink"
names[mi]="missing file"
names[su]="set uid"
names[sg]="set gid"
names[tw]="sticky other writable"
names[ow]="other writable"
names[st]="sticky"
names[ex]="executable"

for i in ${(s.:.)LS_COLORS}
do
    key=${i%\=*}
    color=${i#*\=}
    name=${names[(e)$key]-$key}
    printf '\e[%sm%s\e[m\n' $color $name
done

awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'

echo `tput sitm`italics`tput ritm`
