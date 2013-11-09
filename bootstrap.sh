# old home
[ -a /etc/profile ] && mv /etc/profile ~/.bash_profile

# new home
mount -f $HOMEDRIVE/cygwin~/home /home
pwd >> ~/.bash_history
cp .* ~
mount -c /
mount -f $HOMEDRIVE/cygwin~/srv /srv
mount -f $HOMEDRIVE/cygwin~/usr/local /usr/local
mount -m > /etc/fstab
cd $HOMEDRIVE/dropbox/private
cp -r .ssh ~

# appdata
cd $APPDATA

# breaks here
cp -r $OLDPWD/*/ .
