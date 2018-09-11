#!/usr/bin/awk -f
function v()
{
   getline < "/proc/uptime"
   close("/proc/uptime")
   return $0
}
BEGIN {
   x = v()
   while (1)
   {
      z = v() - x
      printf "%02d:%05.2f\r", z / 60, z % 60
   }
}
