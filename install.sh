#!/bin/dash -e
q=$PWD

# bay
# we need to install bash first for /usr/local/bin
for z in bash 3rvx firefox git less notepad2 windows
do
  cd "$q"/bay/"$z"
  ./install.sh
done

# scripts
find "$q"/scripts "$q"/docs '(' -name '*.sh' -o -name '*.awk' ')' \
-exec ln -f -s -v -t /usr/local/bin {} +
