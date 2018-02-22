#!/bin/dash -e
if [ "$#" != 2 ]
then
  cat <<'eof'
SYNOPSIS
  av-reddit.sh <TYPE> <URL>

TYPE
  ex   external links
  in   internal links

URL
  http://reddit.com/r/stationalpha
  http://reddit.com/r/stationalpha?count=25&after=t3_7kqkqh
eof
  exit 1
fi

sed -E 's/(\?|$)/.json&/; s/^/url /' <<eof |
$2
eof
curl -L -A0 -K- |
case $1 in
ex)
  jq -r '.. | .data?.url // empty'
;;
in)
  jq -r '.. | "reddit.com" + (.permalink? // empty)' | tr -d '\r'
esac
