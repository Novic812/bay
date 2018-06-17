#!/bin/dash -e
# get compiler prefix
if [ "$#" != 1 ]
then
  echo 'prefix.sh <compiler>'
  exit 1
fi
q=$1
z=$(mktemp /tmp/XXX.c)

{
  "$q" -v "$z" 2>&1 |
  grep -E '^ [^ ]+$'

  # need to quote the option for github
  "$q" '-###' "$z" 2>&1 |
  sed '
  /LIBRARY_PATH=/!d
  s///
  y/:/\n/
  '
} |
xargs readlink -e |
sort -u
