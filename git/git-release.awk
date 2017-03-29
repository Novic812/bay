#!/usr/local/bin/awklib -f
function tag(expr,   br, ec) {
  OFS = "."
  for (br = 100; br >= 1; br /= 10) {
    $++ec = trunc(expr / br)
    expr %= br
  }
  return $0
}

BEGIN {
  if (system("[ -d .git ]")) {
    OFS = RS
    print \
    "LOCAL",
    "  1. commit program change",
    "  2. commit version change",
    "  3. tag new version",
    "",
    "REMOTE",
    "  1. push commits",
    "  2. push release"
    exit
  }
  "git ls-tree @ license.txt | git mktree" | getline go
  "git for-each-ref --sort -refname" | getline
  ju = $1
  ki = $NF
  while ("git diff-tree --numstat " go " " ju | getline)
    pa += $1
  while ("git diff-tree --numstat " ju " @" | getline) {
    xr[1] += $1
    xr[2] += $2
  }
  ya = max(xr) / pa * 100
  if (ya >= 100) zu = 100
  else if (ya >= 10) zu = 10
  else zu = 1
  gsub(/[^[:digit:]]/, "", ki)
  printf "old tag = %s\n", tag(ki)
  printf "old tag lines = %d\n", pa
  printf "new tag insertions = %d\n", xr[1]
  printf "new tag deletions = %d\n", xr[2]
  printf "%d/%d = %d%\n", max(xr), pa, ya
  printf "new tag = %s\n", tag(trunc((ki + zu) / zu) * zu)
}
