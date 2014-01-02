# in case of emergency
echo 'PATH=/bin:$PATH PS1="\e];\a\n\e[33m\w\n\e[m# "' >/etc/profile

# mount /home
mount -f $HOMEDRIVE/cygwin~/home /home
mkdir -p ~

# install dotfiles
find -type f -name '.*' -exec cp -t ~ {} +
echo cd >> ~/.bash_history
export CYGWIN=nodosfilewarning
cp -r */ "$APPDATA"

# mount rest
mount -c /
mount -f $HOMEDRIVE/cygwin~/srv /srv
mount -f $HOMEDRIVE/cygwin~/usr/local /usr/local
mount -m > /etc/fstab
