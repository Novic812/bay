# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
{
  echo "$HOMEDRIVE/$USERNAME            /$USERNAME"
  echo "$HOMEDRIVE/cygwin64~/home       /home"
  echo "$HOMEDRIVE/cygwin64~/srv        /srv"
  echo "$HOMEDRIVE/cygwin64~/usr/local  /usr/local"
  echo "$HOMEDRIVE/program files        /opt"
  echo "$HOMEDRIVE/windows              /windows"
} |
  sed -r 's/ {2,}/\t/;s/ /\\040/g;s/$/ . acl/' >/etc/fstab
mount -a

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
