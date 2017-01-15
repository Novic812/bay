#!/usr/bin/awk -f

function quote(str,   d, m, x, y, z) {
  d = "\47"; m = split(str, x, d)
  for (y in x) z = z d x[y] d (y < m ? "\\" d : "")
  return z
}

BEGIN {
  OFS = RS
  if (ARGC != 4) {
    print \
    "SYNOPSIS",
    "  ff-sequence.awk [start] [duration] [file]",
    "",
    "DESCRIPTION",
    "  Make an image sequence from a video"
    exit
  }
  system(sprintf("ffmpeg -hide_banner -ss %s -i %s -t %s -vf %s -vsync vfr " \
  "-q 1 %%d.jpg", quote(ARGV[1]), quote(ARGV[3]), quote(ARGV[2]),
  quote("select='eq(pict_type, I)'")))
}
