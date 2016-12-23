#!/bin/dash -e
install -Dvt "$APPDATA"/Notepad2 Notepad2.ini
ln -sfv "$PWD"/Notepad2.awk /usr/local/bin
ln -sfv "$PWD"/.editor ~
