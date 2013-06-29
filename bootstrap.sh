mount -c /
mount -f $HOMEDRIVE/cygwin~/googlecl /googlecl
mount -f $HOMEDRIVE/cygwin~/home /home
mount -f $HOMEDRIVE/cygwin~/mingw32 /mingw32
mount -f $HOMEDRIVE/cygwin~/opt /opt
mount -f $HOMEDRIVE/cygwin~/php /php
mount -f $HOMEDRIVE/cygwin~/usr/local /usr/local
mount -m > /etc/fstab

# dotfiles
cd /opt/dotfiles
cp .* ~
echo init >> ~/.bash_history
cd $APPDATA
cp -r $OLDPWD/*/ .

# private
cd $HOMEDRIVE/dropbox/private
cp -r .ssh ~
chmod 700 ~/.ssh/id_rsa

# etc
cd /etc
[ -a profile ] && mv profile profile-disable
