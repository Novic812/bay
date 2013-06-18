set -e
mount -c /
mount -f $PUBLIC/home /home
mount -f $PUBLIC/opt /opt
mount -f $PUBLIC/mingw32 /mingw32
mount -f $PUBLIC/usr/local /usr/local
mount -m > /etc/fstab

# dotfiles
cd /opt/dotfiles
cp .* ~
echo init >> ~/.bash_history
cp -r */ $TMP/../../roaming

# private
cd $HOMEDRIVE/dropbox/private
cp -r .ssh bin ~
chmod 700 ~/.ssh/id_rsa

# etc
cd /etc
[ -a profile ] && mv profile profile-disable
