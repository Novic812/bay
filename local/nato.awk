#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 3) {
    print "nato.awk <variable length> <file>"
    exit 1
  }
  var_len = arr_splice(ARGV, 2, 1)
  str_split("alfa bravo charlie delta echo foxtrot golf hotel india juliet " \
  "kilo lima mike november oscar papa quebec romeo sierra tango uniform " \
  "victor whiskey xray yankee zulu", q)
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
  for (each in nfa)
    arr_bpush(m, sprintf("%2d", nfa[each]) FS each)
  arr_sort(m)
  print arr_join(m, RS)
}
