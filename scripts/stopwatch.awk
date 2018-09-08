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
      z = v()
      printf "%02d:%05.2f\r", (z - x) / 60, (z - x) % 60
   }
}
