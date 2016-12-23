#!/bin/dash -e

# /etc
rm -fv /etc/fstab

# /home
rm -fv ~/.bash_history ~/.bashrc ~/.inputrc

# /usr
awk '
BEGIN {FS = "\\"}
{p = p " /usr/local/bin/" $NF}
END {system("rm" p)}
' symlink.txt
