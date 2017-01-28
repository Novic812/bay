#!/usr/bin/awk -f
BEGIN {
  OFS = RS
  if (ARGC != 3) {
    print "bsa.awk [good] [bad]", "", "hex allowed - use 0x"
    exit
  }
  z = ARGV[1]
  y = ARGV[2]
  while (1) {
    x = int((z + y) / 2)
    if (w[x]++)
      break
    printf ARGV[1] ~ /[xX]/ ? "\n%X\n" : "\n%d\n", x
    while (1) {
      printf "[g,b]? "
      getline v < "-"
      if (v == "g")
        z = x
      else if (v == "b")
        y = x
      else {
        print "", "g - good", "b - bad"
        continue
      }
      break
    }
  }
}
