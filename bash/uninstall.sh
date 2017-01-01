#!/bin/dash -e

# /etc
rm -fv /etc/fstab

# /home
rm -fv ~/.bash_history ~/.bashrc ~/.inputrc

# /usr
awk '
function h(j, k) {
  q = "\47"; v = split(j, w, q)
  for (x in w) k = k q w[x] q (x < v ? "\\" q : "")
  return k
}
BEGIN {FS = "\\"}
{z = z " /usr/local/bin/" h($NF)}
END {system("rm" z)}
' symlink.txt
