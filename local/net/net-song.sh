#!/bin/dash
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
elif [ "$#" != 3 ]
then
  cat <<'eof'
SYNOPSIS
  net-song.sh <type> <artist> <song>

TYPE
  1   initial search
  2   upgrade search
eof
  exit 1
fi

# initial and upgrade
"$BROWSER" \
-new-tab "youtube.com/results?q=intext:\"$2 - Topic\" intitle:\"$3\"" \
-new-tab "youtube.com/results?q=-intitle:\"$2\" \"$2\" intitle:\"$3\", hd" \
-new-tab "google.com/search?tbm=vid&q=\"$2 - Topic\" \"$3\""

# initial only
if [ "$1" = 1 ]
then
  "$BROWSER" \
  -new-tab "youtube.com/results?q=allintitle:$2 $3, hd" \
  -new-tab "youtube.com/results?q=allintitle:$2 $3" \
  -new-tab "google.com/search?q=allintitle:$2 $3"
fi
