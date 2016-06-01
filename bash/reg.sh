#!/bin/dash
ya() {
  printf 0x%04x%04x "$@"
}

# app paths
while IFS=, read -r dn bn
do
  reg add 'hklm\software\microsoft\windows\currentVersion\app paths\'"$bn" \
  /f /d "$dn$bn"
done <<+
c:\cygwin64\bin\,bash.exe
c:\program files\notepad2\,notepad2.exe
+

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
done <<+
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
+

# shell options
for xr in drive directory 'directory\background'
do
  reg add 'hkcr\'"$xr"'\shell\Bash\command' /f /d 'cmd /c start /d "%v" bash'
done

# Console
reg add 'hkcu\console' /f /v codePage /t reg_dword /d 65001
reg add 'hkcu\console' /f /v quickEdit /t reg_dword /d 1
reg add 'hkcu\console' /f /v windowPosition /t reg_dword /d "$(ya 300 900)"
reg add 'hkcu\console' /f /v windowSize /t reg_dword /d "$(ya 24 80)"

# remove shortcut text - must restart explorer
reg add 'hkcu\software\microsoft\windows\currentVersion\explorer' /f /v link \
  /t reg_binary /d 00000000

# path
setx /m path 'c:\windows\system32;c:\program files\notepad2'

# clear explorer and wallpaper history
zu='hkcu\software\microsoft\windows\currentVersion\explorer\'
for xr in typedPaths 'wallpapers\images'
do
  if reg query "$zu$xr" 2>/dev/null
  then reg delete "$zu$xr" /f
  fi
done

# clear run history
rundll32 inetcpl.cpl ClearMyTracksByProcess 1

# hide file extensions
reg add 'hkcu\software\microsoft\windows\currentVersion\explorer\advanced' /f \
  /v hideFileExt /t reg_dword /d 0
