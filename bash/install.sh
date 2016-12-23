#!/bin/dash -e

# /etc
ln -sfv "$PWD"/fstab /etc
mount -a

# /home
mkdir -p ~
if [ ! -f .bash_history -a -f ~/.bash_history ]
then mv ~/.bash_history .
else >> .bash_history
fi
ln -sfv "$PWD"/.bash_history "$PWD"/.bashrc "$PWD"/.inputrc ~

# /usr
awk '
{g = g " \47" $0 "\47"}
END {system("ln -sfvt /usr/local/bin" g)}
' symlink.txt
