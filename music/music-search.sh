#!/bin/dash
# Firefox exits 1 if already open
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit
fi
if [ "$#" != 2 ]
then
  echo 'music-search.sh [artist] [song]'
  exit
fi

while read z
do
  "$BROWSER" "$z"
  sleep 1
done <<eof
youtube.com/results?q=intext:"$1 - Topic" intitle:"$2"
youtube.com/results?q="Clapham Junction" intitle:"$1 $2"
youtube.com/results?q=-intitle:"$1" "$1" intitle:"$2", hd
youtube.com/results?q=allintitle:$1 $2, hd
youtube.com/results?q=allintitle:$1 $2
google.com/search?q=allintitle:$1 $2
eof
