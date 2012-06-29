#!/bin/bash

mklink(){
  mapfile -t a < <(cygpath -aw "$@")
  [ -d "$2" ] && d=/d || d=
  cmd /c mklink $d "${a[@]}"
}

# ~
cd "C:/home/GitHub/dotfiles"
git ls-files -ix ".*" | while read line; do
  mklink "$HOME/$line" "$line"
done

# firefox
cd firefox
for i in "$APPDATA"/*/*/Profiles/*; do
  mklink "$i/user.js" "user.js"
  mklink "$i/chrome" "chrome"
done
cd -

# notepad2
cd notepad2
cp * "$APPDATA"/Notepad2
cd -

# Mount C:
mount -c "/"
mount -m > "/etc/fstab"
