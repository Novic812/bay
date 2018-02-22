#!/bin/dash
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
fi
if [ "$#" != 1 ]
then
  echo 'net-artist.sh <artist>'
  exit 1
fi

"$BROWSER" -new-tab albumoftheyear.org/search.php?q="$1" \
-new-tab allmusic.com/search/all/"$1" \
-new-tab metacritic.com/search/all/"$1"/results \
-new-tab pitchfork.com/search/?query="$1"
