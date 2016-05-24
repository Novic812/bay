#!/bin/dash
# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin
cp fstab /etc
mount -a

# copy dotfiles
mkdir -p ~
if [ ! -e .bash_history -a -e ~/.bash_history ]
then
  mv ~/.bash_history .
else
  >> .bash_history
fi
cp .* ~

# restart bash
j=`cygpath -am .`
cd "$j"
cygstart bash
kill -7 "$PPID"
