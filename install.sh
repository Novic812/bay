#!/bin/dash -e
# we need to install shell first for /usr/local/bin
. bash/.profile
for q in bash 3rvx firefox git notepad2 reg
do
  cd "$q"
  ./install.sh
  cd ..
done
