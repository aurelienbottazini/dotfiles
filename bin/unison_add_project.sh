#!/usr/bin/env bash

# create ssh-config file
ssh_config="$PWD/.vagrant/ssh-config"
if ! [ -e ssh_config ]; then
  [ -d .vagrant ] || mkdir .vagrant
  vagrant ssh-config > "$ssh_config"
fi

vagrant ssh -c "mkdir -p $(pwd)"
# create unison profile
profile="
root = .
root = ssh://default//$(pwd)/
ignore = Name {.git,.vagrant}

prefer = .
repeat = 2
terse = true
dontchmod = true
perms = 0
sshargs = -F $ssh_config
"

# write profile

if [ -z ${USERPROFILE+x} ]; then
  UNISONDIR=$HOME
else
  UNISONDIR=$USERPROFILE
fi

project_name="$(basename $(pwd))"

cd $UNISONDIR
[ -d .unison ] || mkdir .unison
echo "$profile" > .unison/$project_name.prf
