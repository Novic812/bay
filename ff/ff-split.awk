#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 2) {
    print "ff-split.awk <cue file>"
    exit 1
  }
}
$1 == "FILE" {
  split($0, un, "\42")
  vi = un[2]
}
$1 == "TRACK" {
  wh[++xr] = $2
}
$1 == "TITLE" && xr {
  split($0, un, "\42")
  ya[xr] = un[2]
}
$1 == "INDEX" && $2 {
  split($3, un, ":")
  zu[xr] = sprintf("%d:%02d:%06.3f", un[1] / 60, un[1] % 60, un[2] + un[3] / 75)
}
END {
  _ = RS
  for (xr in wh) {
    split("ffmpeg" _ "-v" _ "warning" _ "-stats" _ "-i" _ vi _ \
    "-ss" _ zu[xr] _ (zu[xr + 1] ? "-to" _ zu[xr + 1] _ : "") \
    "-b:a" _ "256k" _ "-movflags" _ "faststart" _ \
    "-metadata" _ "track=" wh[xr] _ "-metadata" _ "title=" ya[xr] _ \
    wh[xr] FS ya[xr] ".m4a", br, _)
    sh_trace(br)
  }
}
