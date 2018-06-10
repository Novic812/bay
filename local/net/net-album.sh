#!/bin/dash
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
elif [ "$#" != 1 ]
then
  echo 'net-album.sh <album>'
  exit 1
fi

"$BROWSER" \
-new-tab google.com/search?q="\"$1\" \"btih\"" \
-new-tab google.com/search?q="\"$1\" \"flac\"" \
-new-tab google.com/search?q="\"$1\" \"m4a\"" \
-new-tab google.com/search?q="\"$1\" \"magnet\"" \
-new-tab google.com/search?q="\"$1\" \"mp3\"" \
-new-tab google.com/search?q="\"$1\" \"torrent\""
