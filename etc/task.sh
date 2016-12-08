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
  schtasks /query /v /fo list |
  awk '
  BEGIN {FS = ":  "}
  $1 == "HostName" {xr++}
  {ya[$1][xr] = $0}
  END {
    for (xr in ya["TaskName"]) {
      if (ya["TaskName"][xr] !~ "Microsoft|WPD") {
        if (zu++) print ""
        print ya["TaskName"][xr]
        print ya["Start Time"][xr]
        print ya["Start Date"][xr]
        print ya["Days"][xr]
        print ya["Repeat: Every"][xr]
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
