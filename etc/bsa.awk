#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 3) {
    qu["bsa.awk <good> <bad>", "", "hex allowed - use 0x"]
    print arr_join(qu, RS, 1)
    exit 1
  }
  ARGC = 0
  qu["", "g - good", "b - bad"]
  while (1) {
    xr = mt_div(arr_sum(ARGV), 2)
    if (ya[xr]++)
      break
    printf ARGV[1] ~ /[xX]/ ? "\n%X\n" : "\n%d\n", xr
    while (1) {
      printf "[g,b]? "
      getline zu
      if (zu == "g")
        ARGV[1] = xr
      else if (zu == "b")
        ARGV[2] = xr
      else {
        print arr_join(qu, RS, 1)
        continue
      }
      break
    }
  }
}
