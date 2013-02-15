#!/bin/sh
# reset Firefox

cd $APPDATA
set mozilla/firefox
rm -r $1
cp -r /opt/dotfiles/mozilla .
cd $1
