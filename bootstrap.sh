# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
mount -f "$HOMEDRIVE/$USERNAME"           "/$USERNAME"
mount -f "$HOMEDRIVE/cygwin64~/home"      "/home"
mount -f "$HOMEDRIVE/cygwin64~/srv"       "/srv"
mount -f "$HOMEDRIVE/cygwin64~/usr/local" "/usr/local"
mount -f "$HOMEDRIVE/program files"       "/opt"
mount -f "$HOMEDRIVE/windows"             "/windows"
mount -m >/etc/fstab

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
export CYGWIN=nodosfilewarning
find -maxdepth 1 -type f   -name '.*' -exec cp    -t "$HOME"    {} +
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +

# restart bash
cd $(cygpath -m $PWD)
cygstart bash
kill -7 $PPID
