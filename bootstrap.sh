# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
declare -A sw=(
  [$HOMEDRIVE/${OSTYPE}64~/home]=/home
  [$HOMEDRIVE/${OSTYPE}64~/srv]=/srv
  [$HOMEDRIVE/${OSTYPE}64~/usr/local]=/usr/local
  [$HOMEDRIVE/${OSTYPE}64~/var/cache]=/var/cache
  [$HOMEDRIVE/$USERNAME]=/"$USERNAME"
  [$HOMEDRIVE/program files]=/opt
  [$HOMEDRIVE/windows]=/windows
)
for sg in "${!sw[@]}"
do
  mkdir -p "$sg"
  mount -f "$sg" "${sw[$sg]}"
done
mount -m >/etc/fstab

# PS1 must be exported before you can use ~
# we must assume this has not happened yet
mkdir -p   "$HOME"
echo cd >> "$HOME/.bash_history"
find -maxdepth 1 -type f   -name '.*' -exec cp    -t "$HOME"    {} +
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +

# restart bash
start bash
type git && kill -7 $(ps | awk /daemon/,NF=1)
kill -7 $PPID
