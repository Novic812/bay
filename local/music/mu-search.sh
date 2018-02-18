#!/bin/dash
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
fi
if [ "$#" != 2 ]
then
  echo 'mu-search.sh <artist> <song>'
  exit 1
fi

"$BROWSER" \
-new-tab "youtube.com/results?q=intext:\"$1 - Topic\" intitle:\"$2\"" \
-new-tab "youtube.com/results?q=-intitle:\"$1\" \"$1\" intitle:\"$2\", hd" \
-new-tab "youtube.com/results?q=allintitle:$1 $2, hd" \
-new-tab "youtube.com/results?q=allintitle:$1 $2" \
-new-tab "google.com/search?tbm=vid&q=\"$1 - Topic\" \"$2\"" \
-new-tab "google.com/search?q=allintitle:$1 $2"
