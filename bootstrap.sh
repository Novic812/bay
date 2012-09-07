#!/bin/bash

die(){
  echo -e "\e[1;31m$1\e[m"
  exit
}

[ $SHLVL = 1 ] || die "Usage:  . $0"

# cp prevents programs from writing to the repo
cd /opt/dotfiles
find -name '.*' -type f -exec cp {} ~ \;
find $APPDATA -name chrome -exec cp -r firefox/. {} \;
find $APPDATA -name Notepad2 -exec cp -r notepad2/. {} \;
cd -

# .ssh
cp -r \\dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa

# Apply
. ~/.bash_profile
