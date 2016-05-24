#!/bin/sh
# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin
cp fstab /etc
mount -a

# copy dotfiles
mkdir -p ~
history -w
cp .* ~

# restart bash
j=`cygpath -am .`
cd "$j"
cygstart bash
kill -7 "$PPID"
