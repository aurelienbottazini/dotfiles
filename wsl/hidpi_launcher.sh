#!/bin/bash
export GDK_SCALE=2
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
$@
