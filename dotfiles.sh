#!/bin/sh
# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin
cp fstab /etc
mount -a

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p "$HOME"
history -w
cp .* path.conf "$HOME"
cp -r */ "$APPDATA"

# restart bash
pw=$(cygpath -m ~+)
cd "$pw"
cygstart bash
kill -7 $PPID
