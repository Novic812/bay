mount -c /
mount -f $HOMEDRIVE/cygwin~/home /home
mount -f $HOMEDRIVE/cygwin~/opt /opt
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

# etc
cd /etc
[ -a profile ] && mv profile ~/.profile
