#!/bin/dash -e
install -Dvt "$APPDATA"/mozilla/firefox profiles.ini
install -Dvt "$APPDATA"/mozilla/firefox/0 prefs.js
install -Dvt "$APPDATA"/mozilla/firefox/1 prefs.js
ln -sfv "$PWD"/.browser ~
