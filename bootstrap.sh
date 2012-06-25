#!/bin/sh
# Cygwin post install
d="C:/home/GitHub/dotfiles"

# Mount C:
mount -c "/"
mount -m > "/etc/fstab"

# Create symlinks
#ls -A "$d" | while read line; do
#  ln -sf "$d/$line"
#done
ln -sf "$d/.bash_profile"
ln -sf "$d/.gemrc"
ln -sf "$d/.gitconfig"
ln -sf "$d/.inputrc"
ln -sf "$d/.ssh"
ln -sf "$d/.wgetrc"
ln -sf "$d/bin"

# Create Firefox symlinks
base="/c/home/GitHub/dotfiles/firefox"
profile="$(cygpath -F26)/*/*/Profiles/*"

mklink(){
    test -d "$2" && local d=/d
    cmd /c mklink $d "$(cygpath -w $1)" "$(cygpath -w $2)"
}

# Custom preferences
cd $profile
mklink "user.js" "$base/user.js"

# Custom CSS
mklink -d "chrome" "$base/chrome"
