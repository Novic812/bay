#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC != 3) {
    _["bsa.awk <good> <bad>", "", "hex allowed - use 0x"]
    str_dump(arr_search(_))
    exit 1
  }
  ARGC = 0
  _["", "g - good", "b - bad"]
  while (1) {
    q = math_div(arr_sum(ARGV), 2)
    if (y[q]++)
      break
    printf ARGV[1] ~ /[xX]/ ? "\n%X\n" : "\n%d\n", q
    while (1) {
      printf "[g,b]? "
      getline z
      if (z == "g")
        ARGV[1] = q
      else if (z == "b")
        ARGV[2] = q
      else {
        str_dump(arr_search(_))
        continue
      }
      break
    }
  }
}
