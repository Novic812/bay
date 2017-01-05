#!/usr/bin/awk -f
{
  x[NR] = $NF
}
END {
  for (y in x) {
    "curl -IL -o /dev/null -w %{url_effective} " x[y] | getline x[y]
  }
  for (y in x) {
    split(x[y], z, "/")
    printf "http://%s/q/%s%s\n", z[3], z[5], z[7] ? "#" z[7] : ""
  }
}
