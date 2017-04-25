#!/usr/local/bin/awklib -f

BEGIN {
  if (ARGC != 4) {
    br["SYNOPSIS", "ff-seq.awk <start> <duration> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video"]
    print str_gsub(SUBSEP, RS, arr_index(br))
    exit 1
  }
  br["ffmpeg", "-hide_banner", "-ss", ARGV[1], "-i", ARGV[3], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg"]
  sh_trace(arr_index(br))
}
