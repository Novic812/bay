#!/usr/bin/awk -f
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
    nfa[substr(q[each], 1, var_len)] = 1
  }
}
{
  for (each in nfa) {
    if (tolower($0) ~ each) {
      nfa[each] = 0
    }
  }
}
END {
  for (each in nfa) {
    if (nfa[each]) {
      print each
    }
  }
}
