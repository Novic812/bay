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
function g(j,   k, q, w, x, z) {
  k = "\47"; q = split(j, w, k)
  for (x in w) z = z k w[x] k (x < q ? "\\" k : "")
  return z
}
{j = j FS g($0)}
END {system("ln -sfvt /usr/local/bin" j)}
' symlink.txt
