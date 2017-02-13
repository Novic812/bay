#!/usr/local/bin/stdlib awk
BEGIN {
  OFS = RS
  if (ARGC != 3) {
    print "bsa.awk [good] [bad]", "", "hex allowed - use 0x"
    exit
  }
  while (1) {
    x = int(mean(ARGV))
    if (w[x]++)
      break
    printf ARGV[1] ~ /[xX]/ ? "\n%X\n" : "\n%d\n", x
    while (1) {
      printf "[g,b]? "
      getline v < "-"
      if (v == "g")
        ARGV[1] = x
      else if (v == "b")
        ARGV[2] = x
      else {
        print "", "g - good", "b - bad"
        continue
      }
      break
    }
  }
}
