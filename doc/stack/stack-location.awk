#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC != 3) {
    sb["SYNOPSIS", "  stack-location.awk <infile> <outfile>", "",
    "EXAMPLE", "  stack-location.awk /dev/clipboard /tmp/stack.txt"]
    print ad_join(sb, RS)
    exit 1
  }
  while (getline < ARGV[1]) {
    pa[++NR] = $NF
  }
  for (qu in pa) {
    "curl -IL -o /dev/null -w %{url_effective} " pa[qu] | getline pa[qu]
  }
  for (qu in pa) {
    split(pa[qu], xr, "/")
    pa[qu] = sprintf("http://%s/q/%s%s", xr[3], xr[5], xr[7] ? "#" xr[7] : "")
  }
  print a_join(pa, RS) > ARGV[2]
  system(ENVIRON["EDITOR"] FS ARGV[2])
}
