#!/usr/bin/awk -f
$1 == $2 {
  next
}
$1 > $2 {
  y[$2 FS $1]
  next
}
{
  y[$1 FS $2]
}
END {
  for (z in y) print z
}
