#!/bin/dash -e
PATH=/usr/local/bin:/usr/bin
export CYGWIN=winsymlinks:native
for q in */
do
  cd "$q"
  ./install.sh
  cd ..
done
