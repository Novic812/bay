# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
sw=(
  ${OSTYPE}64~/home
  ${OSTYPE}64~/srv
  ${OSTYPE}64~/usr/local
  ${OSTYPE}64~/var/cache
  "$USERNAME"
  'program files'
  windows
)
for sg in "${sw[@]}"
do
  mkdir -p $HOMEDRIVE/"$sg"
  set ${sg/ }
  mount -f $HOMEDRIVE/"$sg" /${1#*/}
done
mount -m >/etc/fstab
mkgroup  >/etc/group
mkpasswd >/etc/passwd

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
find -maxdepth 1 -type f   -name '.*' -exec cp    -t "$HOME"    {} +
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +

# restart bash
start bash
type git &>/dev/null && kill -7 $(ps | awk /daemon/,NF=1)
kill -7 $PPID
