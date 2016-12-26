#!/bin/sh
# Firefox exits 1 if already open
jn() {
  # parse JSON
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
- format
- track titles
- track lengths
eof
  exit
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
