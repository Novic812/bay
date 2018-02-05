#!/bin/dash -e

# /etc
rm -fv /etc/fstab
cp -v /etc/defaults/etc/profile /etc

# /home
rm -fv ~/.bash_history ~/.inputrc ~/.profile
