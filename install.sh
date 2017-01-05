#!/bin/dash -e
# we need to install shell first for /usr/local/bin
. shell/.profile
for q in shell browser editor git reg volume
do
  cd "$q"
  ./install.sh
  cd ..
done
