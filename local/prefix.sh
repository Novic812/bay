#!/bin/dash -e
# get compiler prefix
if [ "$#" != 1 ]
then
  echo 'prefix.sh <compiler>'
  exit 1
fi

"$1" -E -v -x c /dev/null 2>&1 |
awk '
BEGIN {
  FS = "="
}
/^ [^ ]+$/
$1 == "LIBRARY_PATH" {
  gsub(":", "\n", $2)
  print $2
}
' |
xargs readlink -e |
sort -u
