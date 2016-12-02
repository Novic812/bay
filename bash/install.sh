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
ln -sf "$SYSTEMROOT"/system32/reg "$SYSTEMROOT"/system32/rundll32 \
"$SYSTEMROOT"/system32/setx "$PROGRAMFILES"/notepad2/notepad2 /usr/local/bin
find /usr/local/bin -type l -! -exec test -e {} ';' -print

# close
echo 'you must close shell to apply changes'
