#!/usr/local/bin/velour -f

BEGIN {
  if (ARGC != 5) {
    dc["SYNOPSIS", "av-seq.awk <start> <duration> <frames> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video", "", "FRAMES",
    "key   I frames only", "all   I, P and B frames"]
    print ah_join(dc, RS)
    exit 1
  }

  dc["ffmpeg", "-ss", ARGV[1], "-i", ARGV[4], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg"]

  if (ARGV[3] == "all") {
    ah_splice(dc, 8, 2)
  }

  kd_trace(dc)
}
