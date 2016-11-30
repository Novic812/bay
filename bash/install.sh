#!/bin/sh -e
. ./.bashrc

# /etc
ln -sf "$PWD"/fstab /etc

# /home
mkdir -p ~
if [ ! -e .bash_history -a -e ~/.bash_history ]
then
  mv ~/.bash_history .
else
  >> .bash_history
fi
find "$PWD" -type f -name '.*' -exec ln -sft ~ {} +

# /usr
ln -sf "$PROGRAMFILES"/notepad2/notepad2 "$SYSTEMROOT"/system32/reg \
/usr/local/bin

# close
echo 'you must close shell to apply changes'
