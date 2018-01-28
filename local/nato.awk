#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC < 3) {
    print "nato.awk <variable length> <file>..."
    exit 1
  }
  var_len = ar_splice(ARGV, 2, 1)
  rx_split(FS, "alfa bravo charlie delta echo foxtrot golf hotel india juliet " \
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
  for (each in nfa) {
    ar_bpush(m, sprintf("%2d", nfa[each]) FS each)
  }
  ar_sort(m)
  print ar_join(m, RS)
}
