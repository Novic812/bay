#!/usr/bin/awk -f
BEGIN {
  if (ARGC != 3) {
    print "bsa.awk GOOD BAD"
    exit
  }
  z = ARGV[1]
  y = ARGV[2]
  while (1) {
    x = int((z + y) / 2)
    if (w[x]++)
      break
    print
    print x
    while (1) {
      printf "[g,b]? "
      getline v < "-"
      if (v == "g")
        z = x
      else if (v == "b")
        y = x
      else {
        printf \
        "\n" \
        "g - good\n" \
        "b - bad\n"
        continue
      }
      break
    }
  }
}
