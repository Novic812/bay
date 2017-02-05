#!/usr/local/bin/stdlib awk

BEGIN {
  _ = OFS = RS
  if (ARGC != 4) {
    print \
    "SYNOPSIS",
    "  ff-seq.awk [start] [duration] [file]",
    "",
    "DESCRIPTION",
    "  Make an image sequence from a video"
    exit
  }
  split("ffmpeg" _ "-hide_banner" _ "-ss" _ ARGV[1] _ "-i" _ ARGV[3] _ \
  "-t" _ ARGV[2] _ "-vf" _ "select='eq(pict_type, I)'" _ "-vsync" _ "vfr" _ \
  "-q" _ 1 _ "%d.jpg", br, _)
  xtrace(br)
}
