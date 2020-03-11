#!/bin/bash
export GDK_SCALE=2
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
/usr/bin/emacs 
# emacs . >/dev/null 0>&2dd &
