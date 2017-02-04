#!/usr/local/bin/stdlib awk
# github.com/svnpenn/stdlib

BEGIN {
  OFS = RS
  if (ARGC != 4) {
    print \
    "SYNOPSIS",
    "  ff-seq.awk [start] [duration] [file]",
    "",
    "DESCRIPTION",
    "  Make an image sequence from a video"
    exit
  }
  br["ffmpeg", "-hide_banner", "-ss", ARGV[1], "-i", ARGV[3], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg"]
  xtrace(br)
}
