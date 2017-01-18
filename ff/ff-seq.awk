#!/usr/bin/awk -f

function wrap(text,   q, y, z) {
  while (text) {
    q = match(text, / |$/); y += q; if (y > 80) {z = z RS; y = q - 1}
    else if (z) z = z FS; z = z substr(text, 1, q - 1)
    text = substr(text, q + 1)
  }
  return z
}

function xtrace(arr,   br, ch, de, ec, pa, qu, ro) {
  br = "\47"; for (ch in arr) split(ch, de, SUBSEP); for (ch in de) {
    ec = split(de[ch], pa, br); pa[1]; for (qu in pa) {
      ro = ro \
      (!ec || pa[qu] ~ /[^[:alnum:]%+,./:=@_-]/ ? br pa[qu] br : pa[qu]) \
      (qu < ec ? "\\" br : "")
    }
    ro = ro FS
  }
  printf "\33[36m%s\33[m\n", wrap(ro)
  system(ro)
}

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
