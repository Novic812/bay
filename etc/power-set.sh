#!/bin/dash -e
pa() {
  if [ "$#" = 0 ]
  then echo
  else (
    shift
    pa "$@"
  ) | while read qu
    do printf '%s %s\n%s\n' "$1" "$qu" "$qu"
    done
  fi
}
pa "$@"
