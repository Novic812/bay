#!/bin/dash -e
# this script needs to work without velour

# /etc
cp -v fstab profile /etc
mount -a

# /home
if [ ! -f /usr/local/.bash_history ] && [ -f ~/.bash_history ]
then
  mv ~/.bash_history /usr/local
else
  >> /usr/local/.bash_history
fi
ln -f -s -v "$PWD"/.bash_logout "$PWD"/.inputrc "$PWD"/.profile ~

# /usr/share
tic cygwin-readline.ti
tic cygwin-less.ti
