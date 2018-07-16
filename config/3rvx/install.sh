#!/bin/dash -e
q=$SYSTEMDRIVE'/Program Files (x86)/3RVX/Skins'
z=$q'/Windows Default'
[ -d "$q" ]
mkdir -p -v "$z"/OSD
ln -f -s -v "$PWD"/skin.xml "$z"
ln -f -s -v "$PWD"/settings.xml "$APPDATA"/3RVX
cd "$z"/OSD
set *.png
if [ ! -f "$1" ]
then
  set https://raw.githubusercontent.com/malensek/3RVX/master/Skins
  curl -K- <<eof
url $1/Windows%20Default/OSD/background.png
remote-name
url $1/Windows%20Default/OSD/bar.png
remote-name
eof
fi
