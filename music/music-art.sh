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
{
  gsub(" ", "+")
  j = j " -new-tab \47" $0 "\47"
}
END {
  system(ENVIRON["BROWSER"] j)
}
' <<eof
discogs.com/search?q=$1 $2
fanart.tv/api/getdata.php?type=2&s=$1
google.com/search?tbm=isch&q=$1 $2
musicbrainz.org/search?type=release&query=$1 $2
wikipedia.org/w/index.php?search=$1 $2
eof
