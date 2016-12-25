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
function ch(ec, go) {
  ju = "\47"; ki = split(ec, pa, ju)
  for (qu in pa) go = go ju pa[qu] ju (qu < ki ? "\\" ju : "")
  return go
}
{g = g FS ch($0)}
END {system("ln -sfvt /usr/local/bin" g)}
' symlink.txt
