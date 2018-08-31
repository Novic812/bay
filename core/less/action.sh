#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'synopsis: action.sh <operation>
operations:
  -i: install
  -r: remove'
  exit 1
fi
case $1 in
-i)
  ln -f -s "$PWD"/less.sh /usr/local/bin
;;
-r)
  rm -f /usr/local/bin/less.sh
esac
