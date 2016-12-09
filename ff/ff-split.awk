#!/usr/bin/awk -f
BEGIN {
  if (ARGC != 2) {
    print "ff-split.sh [cue file]"
    exit
  }
}
$1 == "FILE" {
  split($0, i, /\42/)
  file = i[2]
}
$1 == "TRACK" {
  tracks[++j] = $2
}
$1 == "TITLE" && j {
  split($0, i, /\42/)
  titles[j] = i[2]
}
$1 == "INDEX" && $2 {
  split($3, i, ":")
  indexes[j] = sprintf("%d:%02d:%06.3f", i[1]/60, i[1]%60, i[2]+i[3]/75)
}
END {
  for (each in tracks) {
    system(sprintf("set -x; ffmpeg -v warning -stats -i '%s' -ss %s %s" \
    "-b:a 256k -movflags faststart -metadata track=%s -metadata title='%s' " \
    "'%s %s'.m4a", file, indexes[each],
    indexes[each+1] ? "-to " indexes[each+1] " ": "", tracks[each],
    titles[each], tracks[each], titles[each]))
  }
}
