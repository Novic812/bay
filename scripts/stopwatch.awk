#!/usr/bin/awk -f
function q()
{
  getline < "/proc/uptime"
  close("/proc/uptime")
  return $0
}
BEGIN {
  x = q()
  while (1)
  {
    z = q()
    printf "%02d:%05.2f\r", (z - x) / 60, (z - x) % 60
  }
}
