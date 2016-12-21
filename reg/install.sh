#!/bin/dash -e

# App Paths
REG ADD \
  'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\bash.exe' \
  /d 'C:\cygwin64\bin\bash.exe' /f
REG ADD \
  'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\cygstart.exe' \
  /d 'C:\cygwin64\bin\cygstart.exe' /f
REG ADD \
  'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Notepad2.exe' \
  /d 'C:\Program Files\Notepad2\Notepad2.exe' /f

# Notepad2
REG ADD 'HKCR\.css' /v PerceivedType /f
REG ADD 'HKCR\.htm' /v PerceivedType /f
REG ADD 'HKCR\.ini' /v PerceivedType /f
REG ADD 'HKCR\.txt' /v PerceivedType /f
REG ADD 'HKCR\CSSfile\shell' /d Notepad2 /f
REG ADD 'HKCR\CSSfile\shell\Notepad\command' /d 'notepad "%1"' /f
REG ADD 'HKCR\CSSfile\shell\Notepad2\command' /d 'Notepad2 "%1"' /f
REG ADD 'HKCR\FirefoxHTML\shell' /d Firefox /f
REG ADD 'HKCR\FirefoxHTML\shell\Firefox\command' /d 'firefox "%1"' /f
REG ADD 'HKCR\FirefoxHTML\shell\Notepad\command' /d 'notepad "%1"' /f
REG ADD 'HKCR\FirefoxHTML\shell\Notepad2\command' /d 'Notepad2 "%1"' /f
REG ADD 'HKCR\inifile\shell' /d Notepad2 /f
REG ADD 'HKCR\inifile\shell\Notepad\command' /d 'notepad "%1"' /f
REG ADD 'HKCR\inifile\shell\Notepad2\command' /d 'Notepad2 "%1"' /f
REG ADD 'HKCR\JSFile\shell' /d Wscript /f
REG ADD 'HKCR\JSFile\shell\Notepad\command' /d 'notepad "%1"' /f
REG ADD 'HKCR\JSFile\shell\Notepad2\command' /d 'Notepad2 "%1"' /f
REG ADD 'HKCR\JSFile\shell\Wscript\command' /d 'wscript "%1"' /f
REG ADD 'HKCR\txtfile\shell' /d Notepad2 /f
REG ADD 'HKCR\txtfile\shell\Notepad\command' /d 'notepad "%1"' /f
REG ADD 'HKCR\txtfile\shell\Notepad2\command' /d 'Notepad2 "%1"' /f
REG ADD 'HKCR\Unknown\shell' /d Notepad2 /f
REG ADD 'HKCR\Unknown\shell\Notepad\command' /d 'notepad "%1"' /f
REG ADD 'HKCR\Unknown\shell\Notepad2\command' /d 'Notepad2 "%1"' /f

# shell options
REG ADD 'HKCR\Drive\shell\Bash\command' /d "cygstart -d '%v' bash" /f
REG ADD 'HKCR\Directory\shell\Bash\command' /d "cygstart -d '%v' bash" /f
REG ADD 'HKCR\Directory\Background\shell\Bash\command' \
  /d "cygstart -d '%v' bash" /f

# Console
REG ADD 'HKCU\Console' /v CodePage /t REG_DWORD /d 65001 /f
REG ADD 'HKCU\Console' /v QuickEdit /t REG_DWORD /d 1 /f
REG ADD 'HKCU\Console' /v WindowPosition /t REG_DWORD /d 0x012C0384 /f
REG ADD 'HKCU\Console' /v WindowSize /t REG_DWORD /d 0x00180050 /f

# remove shortcut text - must restart explorer
REG ADD 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer' \
  /v Link /t REG_BINARY /d 00000000 /f

# Path
SETX Path 'C:\ProgramData\Bin;C:\Windows\System32' /M

# hide file extensions
REG ADD 'HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' \
  /v HideFileExt /t REG_DWORD /d 0 /f
