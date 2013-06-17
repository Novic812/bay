set -e
mount -c /
mount -f $PUBLIC/home /home
mount -f $PUBLIC/opt /opt
mount -f $PUBLIC/mingw32 /mingw32
mount -f $PUBLIC/usr/local /usr/local
mount -m > /etc/fstab

# home
cd /opt/dotfiles
find -maxdepth 1 -name '.*' -type f -exec cp -t ~ {} +
echo init >> ~/.bash_history
cd $HOMEDRIVE/dropbox/private
cp -r .ssh bin ~
chmod 700 ~/.ssh/id_rsa

# appdata
cd $APPDATA
cd -
find -maxdepth 1 ! -name '.*' -type d -exec cp -rt $OLDPWD {} +

# etc
cd /etc
[ -a profile ] && mv profile profile-disable
