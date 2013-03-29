#!/bin/sh

# cp prevents programs from writing to the repo. dirname is needed if you call
# the script without leading path elements.
cd $(dirname $0)
find -maxdepth 1 -name '.*' -type f -exec cp -t ~ {} +
cd $APPDATA
cd -
find -maxdepth 1 ! -name '.*' -type d -exec cp -rt $OLDPWD {} +

# do not overwrite existing file
echo ,, >> ~/.bash_history

# private data
cd $HOMEDRIVE/dropbox/private
cp -r .ssh bin ~
chmod 700 ~/.ssh/id_rsa
