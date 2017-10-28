#!/usr/bin/awk -f
BEGIN {
  if (ARGC != 3) {
    print "SYNOPSIS"
    print "  water.awk <gallons per flush> <hours between flushes>"
    print
    print "GALLONS PER FLUSH"
    print "  will be 3.5 or 5"
    print
    print "HOURS BETWEEN FLUSHES"
    print "  will be 3 or 4"
    exit 1
  }
  gpf = ARGV[1]
  hbf = ARGV[2]
  toilet_weekend_day = gpf * 16 / hbf
  toilet_week_day = gpf * 8 / hbf
  shower_day = 17.2
  printf "%d gallons per month\n",
  9 * toilet_weekend_day + 31 * shower_day + 22 * toilet_week_day
}
