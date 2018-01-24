#!/usr/local/bin/awklib -f

BEGIN {
  if (ARGC != 5) {
    sb["SYNOPSIS", "ffmpeg-seq.awk <start> <duration> <frames> <file>", "",
    "DESCRIPTION", "Make an image sequence from a video", "", "FRAMES",
    "key   I frames only", "all   I, P and B frames"]
    print arb_join(sb, RS)
    exit 1
  }
  ar_bpush(z, "ffmpeg")
  ar_bpush(z, "-ss")
  ar_bpush(z, ARGV[1])
  ar_bpush(z, "-i")
  ar_bpush(z, ARGV[4])
  ar_bpush(z, "-t")
  ar_bpush(z, ARGV[2])
  if (ARGV[3] == "key") {
    ar_bpush(z, "-vf")
    ar_bpush(z, "select='eq(pict_type, I)'")
  }
  ar_bpush(z, "-vsync")
  ar_bpush(z, "vfr")
  ar_bpush(z, "-q")
  ar_bpush(z, 1)
  ar_bpush(z, "%d.jpg")
  shv_trace(z)
}
