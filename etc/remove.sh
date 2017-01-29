#!/bin/dash -e
xtrace() {
  awk 'BEGIN {d = "\47"; printf "\33[36m"; while (++q < ARGC) {
  x = split(ARGV[q], y, d); y[1]; for (z in y) printf "%s%s",
  !x || y[z] ~ /[^[:alnum:]%+,./:=@_-]/ ? d y[z] d : y[z], z < x ? "\\" d : ""
  printf q == ARGC - 1 ? "\33[m\n" : FS}}' "$@"
  "$@"
}

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
