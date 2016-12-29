#!/bin/dash -e
q=$SYSTEMDRIVE/'Program Files (x86)/3RVX/Skins'
z=$q/'Windows Default'
[ -d "$q" ]
mkdir -pv "$z"/OSD
ln -sfv "$PWD"/skin.xml "$z"
wget -nc -B https://raw.githubusercontent.com/malensek/3RVX/master/ \
  -i volume.txt -P "$z"/OSD
ln -sfv "$PWD"/settings.xml "$APPDATA"/3RVX
