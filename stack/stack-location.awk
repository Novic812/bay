#!/usr/bin/awk -f
{
  x[NR] = $NF
}
END {
  for (y in x) {
    m[y] = x[y]
    while ("curl -I " x[y] | getline) {
      if ($1 == "Location:") {
        m[y] = $2
      }
    }
  }
  for (y in m) {
    sub(/^[^h]/, "http://&", m[y])
    split(m[y], z, /[/\43]/)
    printf "http://%s/q/%s%s\n", z[3], z[5], z[7] ? "#" z[7] : ""
  }
}
