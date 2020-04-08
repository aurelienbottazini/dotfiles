#!/bin/zsh
HOSTNAME=$HOST
[ -f /usr/bin/keychain ] && /usr/bin/keychain --nogui $HOME/.ssh/id_rsa &>/dev/null
[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
export GDK_SCALE=2
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
$@
