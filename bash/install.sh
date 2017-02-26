#!/bin/dash -e

# /etc
rm -fv /etc/profile
ln -sfv "$PWD"/fstab /etc
mount -a

# /home
mkdir -p ~
if [ ! -f .bash_history ] && [ -f ~/.bash_history ]
then mv ~/.bash_history .
else >> .bash_history
fi
ln -sfv "$PWD"/.bash_history "$PWD"/.inputrc "$PWD"/.profile ~

# /usr
awklib -c '
{
  z = z FS quote($0)
}
END {
  system("ln -sfvt /usr/local/bin" z)
}
' symlink.txt
