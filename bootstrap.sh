#!/bin/bash

die(){
  echo -e "\e[1;31m$1\e[m"
  exit
}

[ $SHLVL = 1 ] || die "Usage:  . $0"

# cp prevents programs from writing to the repo
cd /opt/dotfiles
ls -A | while read r; do
  if [[ -d $r ]]
    then [[ $r > / ]] && cp -r $r $APPDATA
    else [[ $r < / ]] && cp $r ~
  fi
done
cd -

# .ssh
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa

# Apply
. ~/.bash_profile
