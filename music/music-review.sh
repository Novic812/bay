#!/bin/dash
# firefox exits 1 if already open
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit
fi
if [ "$#" != 1 ]
then
  echo 'review.sh [artist]'
  exit
fi

xargs -d '\n' -n 1 "$BROWSER" -new-tab <<z
http://allmusic.com/search/all/$1
http://metacritic.com/search/all/$1/results
http://pitchfork.com/search/?query=$1
http://albumoftheyear.org/search.php?q=$1
z
