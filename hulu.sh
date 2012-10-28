#!/bin/bash

warn(){
  echo -e "\e[1;35m$1\e[m"
  read rp
}

pidof(){
  ps -W | awk /$1/'{print$4;exit}'
}

killall(){
  pidof $1 | xargs kill -f
}

pc=plugin-container
killall $pc
echo ProtectedMode=0 2>/dev/null >$WINDIR/system32/macromed/flash/mms.cfg
warn 'Killed flash player for clean dump.
Restart video then press enter here.'
until read < <(pidof $pc); do warn "$pc not found!"; done
rm -f pg.core
dumper pg $REPLY &
until [ -s pg.core ]; do sleep 1; done
mapfile vids < <(grep -aoz "<video [^>]*>" pg.core | sort | uniq -w123)
rm pg.core
declare -A attr

for i in "${!vids[@]}"; do
  IFS=\" read -a vid <<< "${vids[i]}"
  j=0
  while [[ "${vid[j]}" =~ \ ([^=]*) ]]; do
    attr[$i,${BASH_REMATCH[1]}]="${vid[j+1]}"
    ((j+=2))
  done
  printf "%2d\t%9s\t%s\n" "$i" "${attr[$i,file-type]}" "${attr[$i,cdn]}"
done

warn 'Make choice. Avoid level3.'
set -x
rtmpdump \
-W "http://download.hulu.com/huludesktop.swf" \
-a "${attr[$rp,server]#*//*/}?${attr[$rp,token]//amp;}" \
-o a.flv \
-r "${attr[$rp,server]}" \
-y "${attr[$rp,stream]}"
