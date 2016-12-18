#!/bin/sh
# firefox exits 1 if already open
jn() {
  # parse json
  awk '$1 ~ key {print $2}' RS='([{}]|"?, ?")' FS='": ?"?' key="$1" "$2"
}

proxy() {
  local msg url dt pool px cn
  msg=$1
  url=$2
  set --
  dt=proxy.txt
  printf 'request %s... ' "$msg" >&2
  while :
  do
    if [ "$#" = 0 ]
    then
      touch "$dt"
      mapfile -t pool < "$dt"
      set -- "${pool[@]}"
    fi
    if [ "$#" = 0 ]
    then
      wget -q -O "$dt" txt.proxyspy.net/"$dt"
    fi
    read px cn <<< "$1"
    if [[ ! "$px" =~ : ]]
    then
      shift
      continue
    fi
    if ! wget -q -T 2 -t 1 -O web.json -e http_proxy="$px" "$url"
    then
      shift
      continue
    fi
    if jn responseStatus web.json | grep -q 403
    then
      shift
      continue
    else
      break
    fi
  done
  printf '%s\n' "$px" >&2
  printf '%s\n' "$@" > "$dt"
}

jo() {
  jq -r "$@" | sed 's.\r..'
}

if [ ! "$BROWSER" ]
then
  echo 'BROWSER not set or not exported'
  exit
fi

case $1 in
'')
  cat <<'xr'
musicbrainz.sh date-get <album>  <date>
musicbrainz.sh  img-get <artist> <album>
musicbrainz.sh  img-set <image>

date must be this format: 1982-12

when adding release, make sure to include
- release title
- artist
- type
- status
- date
- format
- track titles
- track lengths
xr
  exit
;;
img-get)
  artist=$2
  album=$3
  "$BROWSER" 'http://google.com/search?tbm=isch&q='"$artist $album"
  "$BROWSER" 'http://fanart.tv/api/getdata.php?type=2&s='"$artist"
  "$BROWSER" 'http://discogs.com/search?q='"$artist $album"
  "$BROWSER" 'http://wikipedia.org/w/index.php?search='"${artist// /+}+${album// /+}"
  "$BROWSER" 'http://musicbrainz.org/search?type=release&query='"$artist $album"
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
    then "$BROWSER" 'http://google.com/search?q='"$qy"
    fi
    proxy "$fd" "ajax.googleapis.com/ajax/services/search/web?v=1.0&q=$qy"
    count=$(jo .responseData.cursor.resultCount web.json)
    printf '%s\t%s\n' "$count" "$fd"
  done |
  sort -nr
;;
esac
