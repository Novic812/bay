#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC != 2) {
    print "stack-location.awk <file>"
    exit 1
  }
  while (getline < ARGV[1]) {
    qu[++NR] = $NF
  }
  for (xr in qu) {
    "curl -IL -o /dev/null -w %{url_effective} " qu[xr] | getline qu[xr]
  }
  for (xr in qu) {
    s_split(qu[xr], zu, "/")
    qu[xr] = sprintf("http://%s/q/%s%s", zu[3], zu[5], zu[7] ? "#" zu[7] : "")
  }
  print a_join(qu, RS)
}
