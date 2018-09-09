#!/bin/dash -e
# clear explorer and wallpaper history
q='hkcu\software\microsoft\windows\currentversion\explorer\'
if reg delete "$q"'typedpaths' /f
then
   reg delete "$q"'wallpapers\images' /f
fi
