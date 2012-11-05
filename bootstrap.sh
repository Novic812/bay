#!/bin/sh
. /etc/profile

# cp prevents programs from writing to the repo
cd ${0%/*}
cp .* ~
cp -r bin /usr/local
cp -r moonch~1 notepad2 $APPDATA 2>/dev/null
echo ! > ~/.bash_history

# git is very picky about the permissions
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa
