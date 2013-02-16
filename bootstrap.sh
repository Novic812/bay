#!/bin/bash

# assume PATH is set and HOME exists. cp prevents programs from writing to the
# repo. dirname is needed if you call the script without leading path elements.
read q < <(dirname $0)
cd $q
find -maxdepth 1 -name '.*' -type f -exec cp -t ~ {} +
cd $APPDATA
cd -
find -maxdepth 1 ! -name '.*' -type d -exec cp -rt $OLDPWD {} +

# do not overwrite existing file
echo ,, >> ~/.bash_history

# git is very picky about the permissions
cd $HOMEDRIVE
cd -
cp -r $OLDPWD/dropbox/documents/.ssh ~
chmod 700 ~/.ssh/id_rsa
