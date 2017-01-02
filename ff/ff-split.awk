#!/usr/bin/awk -f
function br(ch,   ec, ki, pa, qu, ro) {
  ec = "\47"; ki = split(ch, pa, ec)
  for (qu in pa) ro = ro ec pa[qu] ec (qu < ki ? "\\" ec : "")
  return ro
}
BEGIN {
  if (ARGC != 2) {
    print "ff-split.awk [cue file]"
    exit
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
  for (xr in wh) {
    system(sprintf("ffmpeg -v warning -stats -i %s -ss %s%s -b:a 256k " \
    "-movflags faststart -metadata track=%s -metadata title=%s %s.m4a",
    br(vi), zu[xr], zu[xr+1] ? " -to " zu[xr+1]: "", wh[xr], br(ya[xr]),
    br(wh[xr] FS ya[xr])))
  }
}
