#!/bin/dash -e

# /etc
rm -fv /etc/profile
ln -sfv "$PWD"/fstab /etc
mount -a

# /home
mkdir -p ~
if [ ! -f .bash_history ] && [ -f ~/.bash_history ]
then
  mv ~/.bash_history .
else
  >> .bash_history
fi
ln -sfv "$PWD"/.bash_history "$PWD"/.bash_logout "$PWD"/.inputrc \
"$PWD"/.profile ~

# /usr/share
tic cygwin-readline.ti
tic cygwin-less.ti
