#!/bin/dash -e
if [ "$#" != 1 ]
then
  echo 'synopsis: action.sh <operation>
operations:
  -i: install
  -r: remove'
  exit 1
fi
case $1 in
-i)
  # install needs to work without velour
  # /etc
  cp -v fstab profile /etc
  mount -a

  # /home
  if [ ! -f /usr/local/.bash_history ] && [ -f ~/.bash_history ]
  then
    mv ~/.bash_history /usr/local
  else
    >> /usr/local/.bash_history
  fi
  ln -f -s -v "$PWD"/.bash_logout "$PWD"/.inputrc "$PWD"/.profile ~

  # /usr/share
  tic cygwin-readline.ti
  tic cygwin-less.ti
;;
-r)
  # /etc
  rm -f -v /etc/fstab
  cp -v /etc/defaults/etc/profile /etc

  # /home
  rm -f -v ~/.bash_history ~/.bash_logout ~/.inputrc ~/.profile
esac
