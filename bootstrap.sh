#!/bin/bash

upath ()
{
  cd ${!1}
  read $1 < <(pwd)
  cd ~-
}

. /etc/profile
cd ~-

# cp prevents programs from writing to the repo. dirname is needed if you call
# the script without leading path elements.
read q < <(dirname $0)
cd $q
compgen -f . | xargs cp -t ~

# do not overwrite existing file
echo ,, >> ~/.bash_history
upath APPDATA
cp -r mozilla notepad2 $APPDATA

# git is very picky about the permissions
upath HOMEDRIVE
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa
