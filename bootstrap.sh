# use .bash_profile instead of /etc/profile
[ -a /etc/profile ] && mv /etc/profile ~/.bash_profile

# mount /home
mount -f $HOMEDRIVE/cygwin~/home /home

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
