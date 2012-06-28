#!/bin/bash

mklink(){
  mapfile -t a < <(cygpath -w "$@")
  [ -d "$2" ] && d=/d || d=
  cmd /c mklink $d "${a[@]}"
}

# ~ files
for i in .{bash_profile,bash_prompt,exports,gemrc,gitconfig,inputrc,ssh,wgetrc}; do
  mklink "$i" "/c/home/GitHub/dotfiles/$i"
done
# git ls-files | grep -v -e .gitignore -e README -e bootstrap.sh -e /

# Symlink all Firefox profiles
for i in "$APPDATA"/*/*/Profiles/*; do
  cd "$i"
  mklink "user.js" "/c/home/GitHub/dotfiles/firefox/user.js"
  mklink "chrome" "/c/home/GitHub/dotfiles/firefox/chrome"
done

# Mount C:
mount -c "/"
mount -m > "/etc/fstab"
