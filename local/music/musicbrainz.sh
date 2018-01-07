#!/bin/dash
# Firefox exits 1 if already open
jn() {
  # parse JSON
  awk '$1 ~ key {print $2}' RS='([{}]|"?, ?")' FS='": ?"?' key="$1" "$2"
}

if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit 1
fi

case $1 in
'')
  cat <<'eof'
musicbrainz.sh date-get <album>  <date>
musicbrainz.sh  img-set <image>

date must be this format: 1982-12

when adding release, make sure to include
- release title
- artist
- type
- status
- date
- country
- release link
- format
- track titles
- track lengths
eof
  exit 1
;;
img-set)
  convert "$2" -resize x1000 -compress lossless 1000-"$2"
;;
date-get)
  album=$2
  date=$3
  cd /tmp
  seq -f %02g 1 31 |
  while read each
  do
    fd="$date-$each"
    qy="%22$album%22 $fd"
    if [ "$each" -eq 1 ]
    then
      "$BROWSER" 'http://google.com/search?q='"$qy"
    fi
    proxy "$fd" "ajax.googleapis.com/ajax/services/search/web?v=1.0&q=$qy"
    count=$(jq -r .responseData.cursor.resultCount web.json | tr -d '\r')
    printf '%s\t%s\n' "$count" "$fd"
  done |
  sort -nr
;;
esac
