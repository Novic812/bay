#!/bin/dash -e
. ./.profile

# /etc
rm -fv /etc/fstab
cp -v /etc/defaults/etc/profile /etc

# /home
rm -fv ~/.bash_history ~/.inputrc ~/.profile

# github.com/svnpenn/stdlib
stdlib awk - symlink.txt <<'eof'
BEGIN {
  FS = "\\"
}
{
  z = z " /usr/local/bin/" quote($NF)
}
END {
  system("rm" z)
}
eof
