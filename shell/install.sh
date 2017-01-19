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
awk '
function quote(str,   d, m, x, y, z) {
  d = "\47"; m = split(str, x, d)
  for (y in x) z = z d x[y] (y < m ? d "\\" d : d)
  return z
}
{j = j FS quote($0)}
END {system("ln -sfvt /usr/local/bin" j)}
' symlink.txt
