mount -c /
mount -f $HOMEDRIVE/cygwin~/home /home
mount -f $HOMEDRIVE/cygwin~/opt /opt
mount -f $HOMEDRIVE/cygwin~/usr/local /usr/local
mount -m > /etc/fstab

# dotfiles
if ! [ -a bootstrap.sh ]
then
  echo wrong directory
  exit
fi
cp .* ~
pwd >> ~/.bash_history
cd $APPDATA
cp -r $OLDPWD/*/ .

# private
cd $HOMEDRIVE/dropbox/private
cp -r .ssh ~

# etc
cd /etc
[ -a profile ] && mv profile ~/.profile
