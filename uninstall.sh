#!/bin/dash -e
PATH=/usr/local/bin:/usr/bin
q=$PWD

# local
find /usr/local/bin -lname '*yacht*' -delete -print

# config
for x in config/*
do
  cd "$q/$x"
  ./uninstall.sh
done
