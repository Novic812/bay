#!/bin/dash -e
PATH=/usr/local/bin:/usr/bin
for g in */
do
  cd "$g"
  ./uninstall.sh
  cd ..
done
