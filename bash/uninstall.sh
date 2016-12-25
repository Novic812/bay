#!/bin/dash -e

# /etc
rm -fv /etc/fstab

# /home
rm -fv ~/.bash_history ~/.bashrc ~/.inputrc

# /usr
awk '
function ch(ec, go) {
  ju = "\47"; ki = split(ec, pa, ju)
  for (qu in pa) go = go ju pa[qu] ju (qu < ki ? "\\" ju : "")
  return go
}
BEGIN {FS = "\\"}
{p = p " /usr/local/bin/" ch($NF)}
END {system("rm" p)}
' symlink.txt
