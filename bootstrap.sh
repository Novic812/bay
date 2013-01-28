#!/bin/bash
. /etc/profile
cd -

# cp prevents programs from writing to the repo. dirname is needed if you call
# the script without leading path elements.
read < <(dirname $0)
cd $REPLY
compgen -f . | xargs cp -t ~

# do not overwrite existing file
echo %% >> ~/.bash_history
cp -r 'moonchild productions' notepad2 $APPDATA 2>/dev/null

# git is very picky about the permissions
cp -r $HOMEDRIVE/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa
