#!/bin/dash -e
cp -v notepad2.ini "$APPDATA"/Notepad2
ln -f -s -v "$PWD"/notepad2.sh /usr/local/bin
ln -f -s -v "$PWD"/.editor ~
