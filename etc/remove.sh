#!/usr/local/bin/stdlib sh

# clear explorer and wallpaper history
while read br
do
  if REG QUERY "$br" >/dev/null 2>&1
  then xtrace REG DELETE "$br" /f
  fi
done <<'eof'
HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths
HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers\Images
eof

# clear run history
xtrace rundll32 inetcpl.cpl ClearMyTracksByProcess 1

# remove dead symlinks
for br in /usr/local/bin/*
do
  if [ -h "$br" ] && [ ! -f "$br" ]
  then rm -v "$br"
  fi
done
