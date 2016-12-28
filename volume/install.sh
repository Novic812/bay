#!/bin/dash -e
q=$SYSTEMDRIVE/'Program Files (x86)/3RVX/Skins'
z=$q/'Windows Default'
[ -d "$q" ]
mkdir -pv "$z"
cp -rv OSD Slider sound.wav skin.xml "$z"
wget -nc -B https://raw.githubusercontent.com/malensek/3RVX/master/ \
  -i volume.txt -P "$z"/OSD
