# in case of emergency
echo 'PATH=/usr/bin:/usr/local/bin:$PATH PS1="\e];\a\n\w\n# "' > /etc/profile

# mount
mount -f $HOMEDRIVE/cygwin~/home /home
mount -f $HOMEDRIVE/cygwin~/srv /srv
mount -f $HOMEDRIVE/cygwin~/usr/local /usr/local
mount -m > /etc/fstab
echo - / cygdrive acl >> /etc/fstab

# install dotfiles
mkdir -p ~
echo cd >> ~/.bash_history
export CYGWIN=nodosfilewarning
find -maxdepth 1 -type f   -name '.*' -exec cp    -t ~          {} +
find -maxdepth 1 -type d ! -name '.*' -exec cp -r -t "$APPDATA" {} +
