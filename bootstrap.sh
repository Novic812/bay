#!/bin/bash
# Script need to be sourced
[ $SHLVL = 2 ] && echo "Usage:  . $0" && exit

# cp prevents programs from writing to the repo
pushd /opt/dotfiles
git ls-files -ix ".*" | xargs cp -t ~
# firefox
cp -r firefox/. "$APPDATA"/*/*/Profiles/*
# notepad2
cp -r notepad2/. "$APPDATA"/Notepad2

# Apply
popd
. ~/.bash_profile
