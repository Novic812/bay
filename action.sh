#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'synopsis: action.sh <operation>
operations:
  -i: install
  -r: remove'
  exit 1
fi
q=$PWD

case $1 in
-i)
  # bay: we need to install bash first for /usr/local/bin
  for z in bash 3rvx firefox git less notepad2 windows
  do
    cd "$q"/bay/"$z"
    ./action.sh -i
  done

  # scripts
  find "$q"/scripts "$q"/docs '(' -name '*.sh' -o -name '*.awk' ')' \
  -exec ln -f -s -v -t /usr/local/bin {} +
;;
-r)
  PATH=/usr/local/bin:/usr/bin
  # local
  find /usr/local/bin -lname "$q/*" -delete -print
  # config
  for z in config/*
  do
    cd "$q/$z"
    ./action.sh -r
  done
esac
