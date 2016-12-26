#!/bin/dash
if [ "$#" = 0 ]
then
  cat <<'wh'
task.sh query

task.sh create minute 45 'hello world'
task.sh create once 23:59 'hello world'
task.sh create sun,tue,thu 23:59 'hello world'

task.sh delete 'hello world'
wh
  exit
fi
case $1 in
query)
  SCHTASKS /Query /FO LIST /V |
  awk '
  BEGIN {FS = ":  "}
  $1 == "HostName" {xr++}
  {ya[xr, $1] = $0}
  END {
    while (br++ < xr) {
      if (ya[br, "TaskName"] !~ "Microsoft|WPD") {
        if (zu++) print ""
        print ya[br, "TaskName"]
        print ya[br, "Start Time"]
        print ya[br, "Start Date"]
        print ya[br, "Days"]
        print ya[br, "Repeat: Every"]
      }
    }
  }
  '
;;
create)
  case $2 in
  minute)
    schtasks /create /tn "$4" /tr "msg * /time 10000 $4" \
    /sc minute /mo "$3"
  ;;
  once)
    schtasks /create /tn "$4" /tr "msg * /time 10000 $4" \
    /sc once /st "$3"
  ;;
  *)
    schtasks /create /tn "$4" /tr "msg * /time 10000 $4" \
    /sc weekly /st "$3" /d "$2"
  ;;
  esac
;;
delete)
  schtasks /delete /tn "$2"
;;
esac
