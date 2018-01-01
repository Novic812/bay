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
ln -sfv "$PWD"/.bash_history "$PWD"/.inputrc "$PWD"/.profile ~

# /usr/local
awklib '
{
  z = z FS sh_escape($0)
}
END {
  system("ln -sfvt /usr/local/bin" z)
}
' symlink.txt

# /usr/share
tic cygwin-readline.ti
tic cygwin-less.ti
