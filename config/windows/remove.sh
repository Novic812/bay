#!/usr/local/bin/shlib

# clear explorer and wallpaper history
if
  REG DELETE \
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths' /f
then
  REG DELETE \
  'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images' /f
fi

# clear run history
sh_trace rundll32 inetcpl.cpl ClearMyTracksByProcess 1
