# use .bash_profile instead of /etc/profile
[ -a /etc/profile ] && mv /etc/profile ~/.bash_profile

# mount /home
mount -f $HOMEDRIVE/cygwin~/home /home

# install dotfiles
cp .* ~
echo cd >> ~/.bash_history
cd $APPDATA
cp -r $OLDPWD/*/ .
cd $HOMEDRIVE/dropbox/private
cp -r .ssh ~

# mount rest
mount -c /
mount -f $HOMEDRIVE/cygwin~/srv /srv
mount -f $HOMEDRIVE/cygwin~/usr/local /usr/local
mount -m > /etc/fstab
