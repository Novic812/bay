# in case of emergency
echo 'PATH=/bin PS1="\e];\a\n\e[33m\w \e[m\n# "' >/etc/profile

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
