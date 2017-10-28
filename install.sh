#!/bin/dash -e
q=$PWD

# config
# we need to install bash first for /usr/local/bin
. config/bash/.profile
for z in bash 3rvx firefox git notepad2 reg
do
  cd "$q"/config/"$z"
  ./install.sh
done

# local
find "$q"/local '(' -name '*.sh' -o -name '*.awk' ')' \
-exec ln -sfvt /usr/local/bin {} +
