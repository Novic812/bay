#!/bin/dash -e

# symlinking fstab is circular dependency with velour
cp -v fstab /etc
mount -a

# /home
mkdir -p ~
if [ ! -f .bash_history ] && [ -f ~/.bash_history ]
then
  mv ~/.bash_history .
else
  >> .bash_history
fi
ln -sfv "$PWD"/.bash_logout "$PWD"/.inputrc "$PWD"/.profile ~
velour -n '
printf "PATH=/bin; ln -sf %s/.bash_history ~; rm /etc/profile",
sh_escape(ARGV[1])
' "$PWD" > /etc/profile

# /usr/share
tic cygwin-readline.ti
tic cygwin-less.ti
