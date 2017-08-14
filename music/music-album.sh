#!/bin/dash
# Firefox exits 1 if already open
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
fi
if [ "$#" != 2 ]
then
  echo 'music-album.sh <artist> <album>'
  exit 1
fi
"$BROWSER" 'https://www.youtube.com/results?sp=CANQFA==&q='"$*"
