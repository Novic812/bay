#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'debug.sh <file>'
  exit 1
fi
y=$1

awk -D/dev/stdin -f "$y" <<'eof' |
dump
q
eof
awk '
/] / {
  sub("[^]]*] ", "")
  print
}
'
