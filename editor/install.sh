#!/bin/dash -e
cp -v notepad2.ini "$APPDATA"/Notepad2
ln -sfv "$PWD"/notepad2.sh /usr/local/bin
ln -sfv "$PWD"/.editor ~
