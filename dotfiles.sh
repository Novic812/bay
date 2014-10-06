# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
sed '
s,   *,\t,
s, ,\\040,g
s,$, . acl,
' >/etc/fstab <<+
$APPDATA/shell/bin              /shell/bin
$APPDATA/shell/home             /home
$HOMEDRIVE/Program Files        /Program Files
$HOMEDRIVE/Program Files (x86)  /Program Files (x86)
$HOMEDRIVE/Repos                /Repos
$HOMEDRIVE/Windows              /Windows
$HOMEDRIVE/$USERNAME            /$USERNAME
+
mount -a

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
find -maxdepth 1 -type f -name '.*' -exec cp -t "$HOME" {} +
while [ -e $APPDATA/mozilla/firefox/default/places.sqlite-shm ]
do
  (( $# )) || printf 'Please close Firefox'
  set 0
  printf .
  sleep .5
done
# FIXME mozilla folder
cp -r notepad2 "$APPDATA"

# restart bash
pw=$(cygpath -m ~+)
cd "$pw"
cygstart bash
kill -7 $PPID $(ps | awk /daemon/,NF=1)
