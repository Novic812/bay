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
function g(h, j) {
  k = "\47"; q = split(h, w, k)
  for (x in w) j = j k w[x] k (x < q ? "\\" k : "")
  return j
}
{z = z FS g($0)}
END {system("ln -sfvt /usr/local/bin" z)}
' symlink.txt
