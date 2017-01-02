#!/bin/dash -e

# /etc
rm -fv /etc/fstab

# /home
rm -fv ~/.bash_history ~/.bashrc ~/.inputrc

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
