# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
mount -f "$HOMEDRIVE/cygwin64~/home"      /home
mount -f "$HOMEDRIVE/cygwin64~/srv"       /srv
mount -f "$HOMEDRIVE/cygwin64~/usr/local" /usr/local
mount -f "$ProgramW6432"                  /programfiles
mount -f "$WINDIR"                        /windows
mount -m > /etc/fstab
echo - / cygdrive acl >> /etc/fstab

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
export CYGWIN=nodosfilewarning
find -maxdepth 1 -type f   -name '.*' -exec cp    -t "$HOME"    {} +
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +

# restart bash
cmd /c start bash
kill -7 $PPID
