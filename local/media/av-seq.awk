#!/usr/local/bin/velour -f

BEGIN {
  if (ARGC != 5) {
    sb["SYNOPSIS", "av-seq.awk <start> <duration> <frames> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video", "", "FRAMES",
    "key   I frames only", "all   I, P and B frames"]
    print ab_join(sb, RS)
    exit 1
  }

  sb["ffmpeg", "-ss", ARGV[1], "-i", ARGV[4], "-t", ARGV[2],
  "-vf", "select='eq(pict_type, I)'", "-vsync", "vfr", "-q", 1, "%d.jpg"]

  if (ARGV[3] == "all") {
    ab_splice(sb, 8, 2)
  }

  kb_trace(sb)
}
