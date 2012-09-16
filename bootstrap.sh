#!/bin/bash

die(){
  echo -e "\e[1;31m$1\e[m"
  exit
}

[ $SHLVL = 1 ] || die "Usage:  . $0"

# cp prevents programs from writing to the repo
cd /opt/dotfiles
find -name '.*' -type f -exec cp {} ~ \;
cp -r moonch~1 notepad2 $APPDATA
cd -

# .ssh
read c < <(cd \\;pwd)
cp -r $c/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa

# Apply
. ~/.bash_profile
