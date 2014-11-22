# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
sed 's,$, . acl,' >/etc/fstab <<+
$HOMEDRIVE/home        /home
$HOMEDRIVE/windows     /windows
$HOMEDRIVE/programdata /programdata
+
mount -a

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p "$HOME"
history -w
find -maxdepth 1 -type f -name '.*' -exec cp -t "$HOME" {} +
# FIXME mozilla folder
cp -r notepad2 "$APPDATA"

# restart bash
pw=$(cygpath -m ~+)
cd "$pw"
cygstart bash
kill -7 $PPID $(ps | awk /daemon/,NF=1)
