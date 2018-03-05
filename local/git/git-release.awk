#!/usr/local/bin/velour -f
function tg(mix,   br, ec) {
  for (br = 100; br >= 1; br /= 10) {
    a_push(ec, n_div(mix, br))
    mix %= br
  }
  return a_join(ec, ".")
}

BEGIN {
  if (sh_system("[ -d .git ]")) {
    sb["LOCAL", "  1. commit program change", "  2. commit version change",
    "  3. tag new version", "", "REMOTE", "  1. push commits",
    "  2. push release"]
    print ab_join(sb, RS)
    exit 1
  }
  "git mktree </dev/null" | getline go
  "git for-each-ref --sort -refname" | getline
  ju = $1
  ki = str_gsub("[^[:digit:]]", "", $3)
  while ("git diff-tree --numstat " go " " ju | getline) {
    if (!/license/) {
      pa += $1
    }
  }
  while ("git diff-tree --numstat " ju " @" | getline) {
    if (!/license/) {
      xr[1] += $1
      xr[2] += $2
    }
  }
  ya = a_max(xr) / pa * 100
  zu = ya >= 100 ? 100 : ya >= 10 ? 10 : 1
  printf "old tag = %s\n", tg(ki)
  printf "old tag lines = %d\n", pa
  printf "new tag insertions = %d\n", xr[1]
  printf "new tag deletions = %d\n", xr[2]
  printf "\33[1;33m%d/%d = %d%\33[m\n", a_max(xr), pa, ya
  printf "new tag = %s\n", tg(zu * n_div(zu + ki, zu))
}
