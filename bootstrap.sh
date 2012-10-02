#!/bin/bash

die(){
  echo -e "\e[1;31m$1\e[m"
  exit
}

realpath(){
  read $1 < <(cd ${!1}; pwd)
}

[ $SHLVL = 1 ] || die "Usage:  . $0"
realpath APPDATA
realpath HOMEDRIVE

# cp prevents programs from writing to the repo
cd /opt/dotfiles
ls -A | while read r; do
  if [[ $r < / ]]; then cp $r ~
    elif [ -d $r ]; then cp -r $r $APPDATA
  fi
done
cd -

# .ssh
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa

# Apply
. ~/.bash_profile
