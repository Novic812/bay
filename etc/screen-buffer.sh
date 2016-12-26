#!/bin/dash -e

wh() {
  printf '0x%04x%04x' "$@"
}

if [ "$#" != 2 ]
then
  xr=$(reg query 'hkcu\console' /v screenBufferSize | awk '$0=$3')
  cat <<eof
screen-buffer.sh [rows] [columns]
max rows is 32767
max columns is 170
current buffer rows $((xr >> 0x0010))
current buffer columns $((xr & 0xFFFF))
eof
  exit
fi
reg add 'hkcu\console' /f /v screenBufferSize /t reg_dword /d "$(wh "$1" "$2")"
reg add 'hkcu\console' /f /v windowSize /t reg_dword /d "$(wh 24 "$2")"
echo 'you must close shell to apply changes'
