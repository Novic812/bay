#!/usr/local/bin/velour -f
BEGIN {
  if (ARGC < 3) {
    print "variable.awk <length> <file>..."
    exit 1
  }
  var_len = a_shift(ARGV)
  a_new(dc, "alfa", "bravo", "charlie", "delta", "echo", "foxtrot", "golf",
  "hotel", "india", "juliet", "kilo", "lima", "mike", "november", "oscar",
  "papa", "quebec", "romeo", "sierra", "tango", "uniform", "victor",
  "whiskey", "xray", "yankee", "zulu")
  for (each in dc) {
    nfa[s_slice(dc[each], 1, var_len)] = 0
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
    a_push(m, sprintf("%2s %s", nfa[each], each))
  }
  a_sort(m)
  k_puts(m)
}
