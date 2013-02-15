#!/bin/bash
# assume PATH is set and HOME exists

# cp prevents programs from writing to the repo. dirname is needed if you call
# the script without leading path elements.
read q < <(dirname $0)
cd $q
compgen -f . | xargs cp -t ~

# do not overwrite existing file
echo ,, >> ~/.bash_history
cd $APPDATA
cd ~-
cp -r mozilla notepad2 $OLDPWD

# git is very picky about the permissions
cd $HOMEDRIVE
cd ~-
cp -r $OLDPWD/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa
