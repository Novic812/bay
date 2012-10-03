#!/bin/bash

die(){
  echo -e "\e[1;31m$1\e[m"
  exit
}

[ $SHLVL = 1 ] || die "Usage:  . $0"
# cp prevents programs from writing to the repo
cd /opt/dotfiles
ls -A | while read r; do
  if [[ $r < / ]]; then cp $r ~
    elif [ -d $r ]; then cp -r $r $APPDATA 2>/dev/null
  fi
done
cd -

# .ssh
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa

# Apply
. ~/.bash_profile
