#!/bin/dash -e

# clear explorer and wallpaper history
if
  REG DELETE \
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths' /f
then
  REG DELETE \
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images' /f
fi
