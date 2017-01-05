#!/bin/dash -e

# /etc
rm -fv /etc/fstab
cp -v /etc/defaults/etc/profile /etc

# /home
rm -fv ~/.bash_history ~/.inputrc ~/.profile

# /usr
awk '
function g(j,   k, q, w, x, z) {
  k = "\47"; q = split(j, w, k)
  for (x in w) z = z k w[x] k (x < q ? "\\" k : "")
  return z
}
BEGIN {FS = "\\"}
{j = j " /usr/local/bin/" g($NF)}
END {system("rm" j)}
' symlink.txt
