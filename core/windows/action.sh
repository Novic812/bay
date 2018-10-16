#!/bin/dash -e
if [ "$#" != 1 ]
then
   echo 'synopsis: action.sh <operation>
operations:
   -i: install
   -r: remove'
   exit 1
fi

case $1 in
-i)
   # have to do this first before we use reg
   velour '
   BEGIN {
      split("ln -f -s -t /usr/local/bin", zu)
   }
   {
      a_push(zu, $0)
   }
   END {
      kv_trace(zu)
   }
   ' symlink.conf

   # Notepad2
   REG ADD 'HKCR\.css' /v PerceivedType /f
   REG ADD 'HKCR\.htm' /v PerceivedType /f
   REG ADD 'HKCR\.ini' /v PerceivedType /f
   REG ADD 'HKCR\.txt' /v PerceivedType /f

   # Cygwin.bat
   REG ADD 'HKCR\*\shell\Notepad2\command' /f /d 'Notepad2 "%1"'
   REG ADD 'HKCR\Unknown\shell' /f /d Notepad2
   REG ADD 'HKCR\Unknown\shell\Notepad2\command' /f /d 'Notepad2 "%1"'

   # - working directory can contain single quotes; wrap with double quotes
   # - drive will end with backslash; add a space to counter
   REG ADD 'HKCR\Drive\shell\Bash\command' /d 'cygstart -d "%v " sh -l' /f
   REG ADD 'HKCR\Directory\shell\Bash\command' /d 'cygstart -d "%v" sh -l' /f
   REG ADD 'HKCR\Directory\Background\shell\Bash\command' /d 'sh -l' /f

   # Console
   REG ADD 'HKCU\Console' /v CodePage /t REG_DWORD /d 65001 /f
   REG ADD 'HKCU\Console' /v QuickEdit /t REG_DWORD /d 1 /f
   REG ADD 'HKCU\Console' /v ScreenBufferSize /t REG_DWORD /d 0x1F400050 /f
   REG ADD 'HKCU\Console' /v WindowPosition /t REG_DWORD /d 0x012C0384 /f
   REG ADD 'HKCU\Console' /v WindowSize /t REG_DWORD /d 0x00180050 /f

   # Environment
   if REG DELETE 'HKCU\Environment' /v TMP /f 2>/dev/null
   then
      set 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment'
      REG DELETE "$1" /v TMP /f
   fi
   SETX PATH 'C:\ProgramData\Local\bin;C:\Windows\System32' /M

   # remove shortcut text - must restart explorer
   set 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer'
   REG ADD "$1" /v Link /t REG_BINARY /d 00000000 /f

   # hide file extensions
   set 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
   REG ADD "$1" /v HideFileExt /t REG_DWORD /d 0 /f

   # App Paths
   set 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\'
   REG ADD "$1"sh.exe /d 'C:\cygwin64\bin\sh.exe' /f
   REG ADD "$1"cygstart.exe /d 'C:\cygwin64\bin\cygstart.exe' /f
   REG ADD "$1"Notepad2.exe /d 'C:\Program Files\Notepad2\Notepad2.exe' /f

   # font linking
   set 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink'
   reg add "$1" /f /t REG_MULTI_SZ /v Consolas /d 'segoeui.ttf\0seguisym.ttf'
   ;;
-r)
   # have to do this first before we remove reg
   REG DELETE 'HKCR\*\shell\Noteapd2' /f

   # remove symlinks
   velour '
   BEGIN {
      FS = "/"
      zu[1] = "rm"
   }
   {
      a_push(zu, "/usr/local/bin/" $NF)
   }
   END {
      kv_trace(zu)
   }
   ' symlink.conf
esac
