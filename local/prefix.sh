#!/bin/dash -e
# get compiler prefix
if [ "$#" != 1 ]
then
  echo 'prefix.sh <compiler>'
  exit 1
fi
qu=$1

ro=$(mktemp /tmp/XXX.c)

echo 'INCLUDE'
"$qu" -v "$ro" 2>&1 | grep -E '^ [^ ]+$' |
while read -r si
do
  if [ -d "$si" ]
  then
    cd "$si"
    while grep -q include <<eof
$PWD
eof
    do cd ..
    done
    pwd
  fi
done | sed '
/\./d
s/^/--prefix /
' | sort -u

echo 'LIB'
"$qu" '-###' "$ro" 2>&1 | sed '
/LIBRARY_PATH=/!d
s///
y/:/\n/
' |
while read -r ta
do
  if [ -d "$ta" ]
  then
    cd "$ta"
    while grep -q lib <<eof
$PWD
eof
    do cd ..
    done
    pwd
  fi
done | sed '
/\./d
s/^/--prefix /
' | sort -u
