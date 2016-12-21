#!/bin/dash -e
install -Dvt "$APPDATA"/mozilla/firefox profiles.ini
ln -sfv "$PWD"/.browser ~
