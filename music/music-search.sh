#!/bin/dash
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

awk '
{
  z = z " -new-tab \47" $0 "\47"
}
END {
  system(ENVIRON["BROWSER"] z)
}
' <<qu
youtube.com/results?q="$1 - Topic" intitle:"$2"
youtube.com/results?q="Clapham Junction" intitle:"$1 $2"
youtube.com/results?q=-intitle:"$1" "$1" intitle:"$2", hd
youtube.com/results?q=allintitle:$1 $2, hd
youtube.com/results?q=allintitle:$1 $2
google.com/search?q=allintitle:$1 $2
qu
