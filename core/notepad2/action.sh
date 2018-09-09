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
  cp -v notepad2.ini "$APPDATA"/Notepad2
  ln -f -s -v "$PWD"/notepad2.sh /usr/local/bin
;;
-r)
  rm -f "$APPDATA"/Notepad2/notepad2.ini /usr/local/bin/notepad2.sh ~/.editor
esac
