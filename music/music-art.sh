#!/bin/dash
if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit
fi
if [ "$#" != 2 ]
then
  echo 'music-art [artist] [album]'
  exit
fi

awk '
function ch(ec, go) {
  ju = "\47"; ki = split(ec, pa, ju)
  for (qu in pa) go = go ju pa[qu] ju (qu < ki ? "\\" ju : "")
  return go
}
{
  gsub(" ", "+")
  system(ch(ENVIRON["BROWSER"]) FS ch($0))
}
' <<eof
discogs.com/search?q=$1 $2
fanart.tv/api/getdata.php?type=2&s=$1
google.com/search?tbm=isch&q=$1 $2
musicbrainz.org/search?type=release&query=$1 $2
wikipedia.org/w/index.php?search=$1 $2
eof
