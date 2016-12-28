#!/bin/dash -e
q=$SYSTEMDRIVE/'Program Files (x86)'
z=$q/'3RVX/Skins/Windows Default'
[ -d "$q" ]
mkdir -pv "$z"/OSD "$z"/Slider
ln -sfv "$PWD"/skin.xml "$z"
touch "$z"/sound.wav "$z"/OSD/eject.png "$z"/OSD/knob.png "$z"/OSD/mute.png \
"$z"/Slider/background.png "$z"/Slider/knob.png
wget -nc -B https://raw.githubusercontent.com/malensek/3RVX/master/ \
-i volume.txt -P "$z"/OSD
