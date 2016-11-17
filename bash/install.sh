#!/bin/sh
. ./.bashrc
ln -sf "$PWD"/fstab /etc
mount -a

# symlink dotfiles
mkdir -p ~
if [ ! -e .bash_history -a -e ~/.bash_history ]
then
  mv ~/.bash_history .
else
  >> .bash_history
fi
find "$PWD" -type f -name '.*' -exec ln -sft ~ {} +

# close
echo 'you must close shell to apply changes'
