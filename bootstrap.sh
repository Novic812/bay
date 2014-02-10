# PATH is defined in ~/.bashrc
# we must assume this has not happened yet
PATH=/bin:$PATH
# "cd" mount lookup is case sensitive
sw=(
  ${OSTYPE}64~/home
  ${OSTYPE}64~/srv
  ${OSTYPE}64~/usr/local
  ${OSTYPE}64~/var/cache
  "$USERNAME"
  'Program Files'
  Windows
)
for sg in "${sw[@]}"
do
  mkdir -p $HOMEDRIVE/"$sg"
  mount -f $HOMEDRIVE/"$sg" /$(awk '{
    gsub(" |^[^/]+/", "")
    print tolower($0)
  }' <<< $sg)
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
