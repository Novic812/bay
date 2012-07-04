#!/bin/bash
# This must not be a function. If you set it as a function and copied it to
# HOME, then make changes to the function in the repo, any further call would be
# calling the old function in HOME.

# Script need to be sourced
[ $SHLVL = 2 ] && echo "Usage: . ${0##*/}" && exit

cd ~/dotfiles

# cp prevents programs from writing to the repo
git ls-files -ix ".*" | xargs cp -t ~
# firefox
cp -r firefox/. "$APPDATA"/*/*/Profiles/*
# notepad2
cp -r notepad2/. "$APPDATA"/Notepad2

# Hide
cd
attrib +h

# Apply
. ~/.bash_profile
