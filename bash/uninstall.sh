#!/bin/dash -e

# /etc
rm -fv /etc/fstab

# /home
rm -rfv ~

# /usr
awk '
BEGIN {FS = "\\"}
{p = p " /usr/local/bin/" $NF}
END {system("rm" p)}
' symlink.txt
