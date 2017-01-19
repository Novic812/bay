#!/bin/dash -e
. ./.profile

# /etc
rm -fv /etc/fstab
cp -v /etc/defaults/etc/profile /etc

# /home
rm -fv ~/.bash_history ~/.inputrc ~/.profile

# /usr
awk '
function quote(str,   d, m, x, y, z) {
  d = "\47"; m = split(str, x, d)
  for (y in x) z = z d x[y] (y < m ? d "\\" d : d)
  return z
}
BEGIN {FS = "\\"}
{j = j " /usr/local/bin/" quote($NF)}
END {system("rm" j)}
' symlink.txt
