#!/bin/dash
if [ ! "$BROWSER" ]
then
   echo 'BROWSER not set or not exported'
   exit 1
elif [ "$#" != 2 ]
then
   echo 'net-album.sh <artist> <album>'
   exit 1
fi

"$BROWSER" \
-new-tab google.com/search?q="\"$1\" \"$2\" \"btih\"" \
-new-tab google.com/search?q="\"$1\" \"$2\" \"flac\"" \
-new-tab google.com/search?q="\"$1\" \"$2\" \"m4a\"" \
-new-tab google.com/search?q="\"$1\" \"$2\" \"magnet\"" \
-new-tab google.com/search?q="\"$1\" \"$2\" \"mp3\"" \
-new-tab google.com/search?q="\"$1\" \"$2\" \"torrent\""
