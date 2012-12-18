#!/bin/bash
. /etc/profile

# cp prevents programs from writing to the repo
read < <(dirname $0)
cd $REPLY
ls -A | grep '^\.' | xargs cp -t ~

# do not overwrite existing file
echo %% >> ~/.bash_history
cp -r moonch~1 notepad2 $APPDATA 2>/dev/null

# git is very picky about the permissions
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa
