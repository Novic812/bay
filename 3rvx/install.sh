#!/bin/dash -e
q=$SYSTEMDRIVE'/Program Files (x86)/3RVX/Skins'
z=$q'/Windows Default'
[ -d "$q" ]
mkdir -pv "$z"/OSD
ln -sfv "$PWD"/skin.xml "$z"
ln -sfv "$PWD"/settings.xml "$APPDATA"/3RVX
cd "$z"/OSD
set *.png
[ ! -f "$1" ]
wget -B https://raw.githubusercontent.com/malensek/3RVX/master/ -i- <<'eof'
Skins/Windows Default/OSD/background.png
Skins/Windows Default/OSD/bar.png
eof
