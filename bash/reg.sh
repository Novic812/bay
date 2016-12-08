#!/bin/dash -e
xr() {
  printf 0x%04x%04x "$@"
}

# app paths
while IFS=, read -r dn bn
do
  reg add 'hklm\software\microsoft\windows\currentVersion\app paths\'"$bn" \
  /f /d "$dn$bn"
done <<'eof'
c:\cygwin64\bin\,bash.exe
c:\cygwin64\bin\,cygstart.exe
c:\program files\notepad2\,notepad2.exe
eof

# Notepad2
while IFS=, read key default command
do
  if [ "$key" != null ]
  then
    reg add 'hkcr\'"$key" /f /d "$default"
    reg add 'hkcr\'"$key" /f /v perceivedType
  fi
  if [ "$command" != null ]
  then
    reg add 'hkcr\'"$default"'\shell\0' /f /d Run
    reg add 'hkcr\'"$default"'\shell\0\command' /f /d "$command"
  fi
  reg add 'hkcr\'"$default"'\shell\1' /f /d Edit
  reg add 'hkcr\'"$default"'\shell\1\command' /f /d 'notepad2 "%1"'
  reg add 'hkcr\'"$default"'\shell\2' /f /d Open
  reg add 'hkcr\'"$default"'\shell\2\command' /f /d 'notepad "%1"'
done <<'eof'
null,unknown,null
.css,cssfile,null
.ini,inifile,null
.nfo,txtfile,null
.txt,txtfile,null
.bat,batfile,"%1" %*
.cmd,cmdfile,"%1" %*
.htm,firefoxhtml,firefox "%1"
.xml,firefoxhtml,firefox "%1"
.reg,regfile,regedit "%1"
.js,jsfile,wscript "%1"
eof

# shell options
for ya in drive directory 'directory\background'
do
  reg add 'hkcr\'"$ya"'\shell\Bash\command' /f /d "cygstart -d '%v' bash"
done

# Console
reg add 'hkcu\console' /f /v codePage /t reg_dword /d 65001
reg add 'hkcu\console' /f /v quickEdit /t reg_dword /d 1
reg add 'hkcu\console' /f /v windowPosition /t reg_dword /d "$(xr 300 900)"
reg add 'hkcu\console' /f /v windowSize /t reg_dword /d "$(xr 24 80)"

# remove shortcut text - must restart explorer
reg add 'hkcu\software\microsoft\windows\currentVersion\explorer' /f /v link \
  /t reg_binary /d 00000000

# path
setx /m path 'c:\programdata\bin;c:\windows\system32'

# clear explorer and wallpaper history
zu='hkcu\software\microsoft\windows\currentVersion\explorer\'
for ya in typedPaths 'wallpapers\images'
do
  if reg query "$zu$ya" >/dev/null 2>&1
  then reg delete "$zu$ya" /f
  fi
done

# clear run history
rundll32 inetcpl.cpl ClearMyTracksByProcess 1

# hide file extensions
reg add 'hkcu\software\microsoft\windows\currentVersion\explorer\advanced' /f \
  /v hideFileExt /t reg_dword /d 0
