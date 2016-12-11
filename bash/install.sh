#!/bin/dash -e
PATH=/bin
export CYGWIN=winsymlinks:native

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
ln -sf "$PROGRAMFILES"/gpac/mp4box.exe \
"$PROGRAMFILES"'/mozilla firefox/firefox.exe' \
"$PROGRAMFILES"/notepad2/notepad2.exe "$SYSTEMROOT"/system32/reg.exe \
"$SYSTEMROOT"/system32/rundll32.exe "$SYSTEMROOT"/system32/setx.exe \
/usr/local/bin
find /usr/local/bin -type l -! -exec test -e {} ';' -print

# close
echo 'you must close shell to apply changes'
