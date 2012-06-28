#!/bin/bash

# ~ files
cd "C:/home/GitHub/dotfiles"
cp -r .bash_profile .bash_prompt .gemrc .gitconfig .inputrc .ssh .wgetrc ~

# Mount C:
mount -c "/"
mount -m > "/etc/fstab"

# Symlink all Firefox profiles
mklink(){
  mapfile -t a < <(cygpath -w "${@: -2}")
  cmd /c mklink ${3+/d} "${a[@]}"
}

for i in "$APPDATA"/*/*/Profiles/*; do
  cd "$i"
  mklink "user.js" "/c/home/GitHub/dotfiles/firefox/user.js"
  mklink -d "chrome" "/c/home/GitHub/dotfiles/firefox/chrome"
done
