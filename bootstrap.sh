#!/bin/bash
# Script need to be sourced
[ $SHLVL = 2 ] && echo "Usage:  . $0" && exit

# cp prevents programs from writing to the repo
cd /opt/dotfiles
find -name .\* -type f -exec cp {} ~ \;
find $APPDATA -name chrome -exec cp -r firefox/. {} \;
find $APPDATA -name Notepad2 -exec cp -r notepad2/. {} \;
cd -

# .ssh
cp -r \\dropbox/documents/.ssh ~

# Apply
. ~/.bash_profile
