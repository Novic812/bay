#!/bin/dash
# Firefox exits 1 if already open
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit
fi
if [ "$#" = 0 ]
then
  echo 'canonical.sh <search terms>'
  exit
fi
"$BROWSER" google.com/search?q="$*"
"$BROWSER" google.com/search?q="$*"'&tbs=qdr:y'
