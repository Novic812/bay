#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'synopsis: action.sh <operation>
operations:
  -i: install
  -r: remove'
  exit 1
fi
oe=$1
pd=$PWD
# we need bash first for /usr/local/bin
set bash 3rvx firefox git less notepad2 windows

case $oe in
-i)
  for each
  do
    cd "$pd"/core/"$each"
    ./action.sh -i
  done

  # scripts
  find "$pd"/scripts "$pd"/docs '(' -name '*.sh' -o -name '*.awk' ')' \
  -exec ln -f -s -t /usr/local/bin {} +
;;
-r)
  # scripts
  find /usr/local/bin -lname "$pd/*" -delete -print

  # core
  for each
  do
    cd "$pd"/core/"$each"
    ./action.sh -r
  done
esac
