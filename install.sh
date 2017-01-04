#!/bin/dash -e
PATH=/usr/local/bin:/usr/bin
export CYGWIN=winsymlinks:native
for q in shell browser editor git reg volume
do
  cd "$q"
  ./install.sh
  cd ..
done
