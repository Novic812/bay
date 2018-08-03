#!/bin/dash -e

# /etc
rm -f -v /etc/fstab
cp -v /etc/defaults/etc/profile /etc

# /home
rm -f -v ~/.bash_history ~/.bash_logout ~/.inputrc ~/.profile
