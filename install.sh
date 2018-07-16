#!/bin/dash -e
q=$PWD

# config
# we need to install bash first for /usr/local/bin
for z in bash 3rvx firefox git less notepad2 windows
do
  cd "$q"/config/"$z"
  ./install.sh
done

# local
find "$q"/local "$q"/doc '(' -name '*.sh' -o -name '*.awk' ')' \
-exec ln -f -s -v -t /usr/local/bin {} +
