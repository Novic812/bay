#!/bin/bash

# ~ files
cd "C:/home/GitHub/dotfiles"
cp -r .bash_profile .bash_prompt .gemrc .gitconfig .inputrc .ssh .wgetrc ~

# Firefox files
cd "firefox"
eval "cp -r . $(cygpath -F26)/*/*/Profiles/*"

# Mount C:
mount -c "/"
mount -m > "/etc/fstab"
