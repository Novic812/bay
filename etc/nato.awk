#!/usr/bin/awk -f
function insertion_sort(arr,   x, y, z) {
  for (x in arr) {
    y = arr[x]; z = x - 1
    while (z && arr[z] > y) {arr[z + 1] = arr[z]; z--} arr[z + 1] = y
  }
}
BEGIN {
  if (ARGC != 3) {
    print "nato.awk [variable length] [file]"
    exit
  }
  var_len = ARGV[1]
  ARGV[1] = ARGV[2]
  delete ARGV[2]
  split("alfa bravo charlie delta echo foxtrot golf hotel india juliet kilo " \
  "lima mike november oscar papa quebec romeo sierra tango uniform victor " \
  "whiskey xray yankee zulu", q)
  for (each in q) {
    nfa[substr(q[each], 1, var_len)] = 0
  }
}
{
  for (each in nfa) {
    if (tolower($0) ~ each) {
      nfa[each]++
    }
  }
}
END {
  for (each in nfa) {
    m[++d] = sprintf("%2d", nfa[each]) FS each
  }
  insertion_sort(m)
  for (each in m) {
    print m[each]
  }
}
