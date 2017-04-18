#!/usr/local/bin/awklib -f
BEGIN {
  if (ARGC == 1) {
    OFS = RS
    print \
    "task.awk query",
    "task.awk create minute 45 'hello world'",
    "task.awk create once 23:59 'hello world'",
    "task.awk create sun,tue,thu 23:59 'hello world'",
    "task.awk delete 'hello world'"
    exit 1
  }
  if (ARGV[1] == "query") {
    FS = ":  "
    while ("SCHTASKS /Query /FO LIST /V" | getline) {
      if ($1 == "HostName")
        xr++
      ya[xr, $1] = $0
    }
    while (br++ < xr) {
      if (ya[br, "TaskName"] !~ "Microsoft|WPD") {
        if (zu++)
          print ""
        print ya[br, "TaskName"]
        print ya[br, "Start Time"]
        print ya[br, "Start Date"]
        print ya[br, "Days"]
        print ya[br, "Repeat: Every"]
      }
    }
  }
  if (ARGV[1] == "create") {
    _ = RS
    if (ARGV[2] == "minute") {
      split("schtasks" _ "/create" _ "/tn" _ ARGV[4] _ \
      "/tr" _ "msg * /time 10000 " ARGV[4] _ "/sc" _ "minute" _ \
      "/mo" _ ARGV[3], ec, _)
      sh_trace(ec)
    }
    else if (ARGV[2] == "once") {
      split("schtasks" _ "/create" _ "/tn" _ ARGV[4] _ \
      "/tr" _ "msg * /time 10000 " ARGV[4] _ "/sc" _ "once" _ \
      "/st" _ ARGV[3], ec, _)
      sh_trace(ec)
    }
    else {
      split("schtasks" _ "/create" _ "/tn" _ ARGV[4] _ \
      "/tr" _ "msg * /time 10000 " ARGV[4] _ "/sc" _ "weekly" _ \
      "/st" _ ARGV[3] _ "/d" _ ARGV[2], ec, _)
      sh_trace(ec)
    }
  }
  if (ARGV[1] == "delete") {
    system("schtasks /delete /tn " sh_escape(ARGV[2]))
  }
}
