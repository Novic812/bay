#!/bin/dash -e
ln -sfv "$PWD"/firefox.sh /usr/local/bin
ln -sfv "$PWD"/.browser ~
install -Dvt "$APPDATA"/mozilla/firefox/profiles/mike/chrome userchrome.css
