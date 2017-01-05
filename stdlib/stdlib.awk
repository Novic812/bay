#!/usr/bin/awk -f

function asrt(b,   x, y, z) {
  for (x in b) {
    y = b[x]
    z = x - 1
    while (z && b[z] > y) {
      b[z + 1] = b[z]
      z--
    }
    b[z + 1] = y
  }
}

function decodeURIComponent(encodedURI,   g, q, y, z) {
  while (g++ < 125) q[sprintf("%X", g)] = sprintf("%c", g)
  while (g = substr(encodedURI, ++y, 1))
    if (g == "%") {
      z = z q[toupper(substr(encodedURI, ++y, 2))]
      ++y
    }
    else z = z g
  return z
}
