# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
sw=(
  "$PROGRAMFILES/$USERNAME"/home
  "$PROGRAMFILES/$USERNAME"/setup
  "$PROGRAMFILES/$USERNAME"/srv
  "$HOMEDRIVE/$USERNAME"
)
for sg in "${sw[@]}"
do
  mount -f "$sg" /"${sg##*/}"
done
mount -m >/etc/fstab

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
export CYGWIN=nodosfilewarning
find -maxdepth 1 -type f -name '.*' -exec cp -t "$HOME" {} +
while ps -W | grep -q firefox
do
  (( $# )) || printf 'Please close Firefox'
  set 0
  printf .
  sleep .5
done
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +

# restart bash
pw=$(cygpath -m ~+)
cd "$pw"
cygstart bash
kill -7 $PPID $(ps | awk /daemon/,NF=1)
