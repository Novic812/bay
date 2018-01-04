#!/bin/dash -e
case $1 in
/*)
  k=$(cygpath -w "$1")
;;
*)
  if [ "$#" != 0 ]
  then
    k=$1
  fi
;;
esac
exec firefox ${k+"$k"}
