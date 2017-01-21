#!/usr/bin/awk -f
function tag(expr,   br, ec) {
  OFS = "."
  for (br = 100; br >= 1; br /= 10) {
    $++ec = int(expr / br)
    expr %= br
  }
  return $0
}

function max(value1, value2) {
  return value1 > value2 ? value1 : value2
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
  "git mktree </dev/null" | getline go
  "git for-each-ref --sort -refname" | getline
  ju = $1
  ki = $NF
  while ("git diff-tree --numstat " go " " ju | getline)
    pa += $1
  while ("git diff-tree --numstat " ju " @" | getline) {
    qu += $1
    xr += $2
  }
  ya = max(qu, xr) / pa * 100
  if (ya >= 100) zu = 100
  else if (ya >= 10) zu = 10
  else zu = 1
  gsub(/[^[:digit:]]/, "", ki)
  printf "old tag = %s\n", tag(ki)
  printf "old tag lines = %d\n", pa
  printf "new tag insertions = %d\n", qu
  printf "new tag deletions = %d\n", xr
  printf "%d/%d = %d%\n", max(qu, xr), pa, ya
  printf "new tag = %s\n", tag(int((ki + zu) / zu) * zu)
}
