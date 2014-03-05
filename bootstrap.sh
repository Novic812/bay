# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
# "cd" mount lookup is case sensitive
sw=(
  ${OSTYPE}64~/home
  ${OSTYPE}64~/setup
  ${OSTYPE}64~/srv
  ${OSTYPE}64~/usr/local
  "$USERNAME"
)
for sg in "${sw[@]}"
do
  mount -f $HOMEDRIVE/"$sg" /"${sg#*/}"
done
mount -m >/etc/fstab

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
export CYGWIN=nodosfilewarning
find -maxdepth 1 -type f   -name '.*' -exec cp    -t "$HOME"    {} +
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +

# restart bash
cd $(cygpath -m ~+)
cygstart bash
type git &>/dev/null && kill -7 $(ps | awk /daemon/,NF=1)
kill -7 $PPID
