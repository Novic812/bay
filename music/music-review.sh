#!/bin/dash
# Firefox exits 1 if already open
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
fi
if [ "$#" != 1 ]
then
  echo 'review.sh <artist>'
  exit 1
fi

"$BROWSER" albumoftheyear.org/search.php?q="$1"
"$BROWSER" allmusic.com/search/all/"$1"
"$BROWSER" metacritic.com/search/all/"$1"/results
"$BROWSER" pitchfork.com/search/?query="$1"
