#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC < 3) {
    print "nato.awk <variable length> <file>..."
    exit 1
  }
  var_len = a_shift(ARGV)
  a_new(dc, "alfa", "bravo", "charlie", "delta", "echo", "foxtrot", "golf",
  "hotel", "india", "juliet", "kilo", "lima", "mike", "november", "oscar",
  "papa", "quebec", "romeo", "sierra", "tango", "uniform", "victor",
  "whiskey", "xray", "yankee", "zulu")
  while (each = a_shift(dc)) {
    nfa[s_slice(each, 1, var_len)] = 0
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
    a_push(m, sprintf("%2d", nfa[each]) FS each)
  }
  print ab_join(a_sort(m), RS)
}
