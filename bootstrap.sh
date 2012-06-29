#!/bin/sh
# Use cp instead of symlink
#   mathiasbynens/dotfiles is using it
#   cp prevents programs from writing to the repo
cd "${0##*/}"

# ~
git ls-files -ix ".*" | xargs cp -t ~

# firefox
cp -r firefox/. "$APPDATA"/*/*/Profiles/*

# notepad2
cp -r notepad2/. "$APPDATA"/Notepad2

# Mount C:
mount -c "/"
mount -m > "/etc/fstab"
