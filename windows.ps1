#!powershell
# We need CRLF line endings so that we can paste into powershell,
# and to play somewhat nice with git.

# This will change the default action for some types, but that should not be an
# issue. Those changed types can still access the other program from right
# click menu.
$keys = 'batfile', 'cmdfile', 'cssfile', 'firefoxhtml', 'inifile', 'jsfile',
        'microsoft.powershellscript.1', 'msinfofile', 'regfile', 'txtfile',
        'unknown', 'xmlfile'
foreach ($key in $keys) {
  sp hklm:software/classes/$key/shell '(default)' edit
  ni hklm:software/classes/$key/shell/edit/command `
    -f -t expandstring -va '"%programfiles%/notepad2/notepad2" %1'
}
sp hkcu:software/microsoft/office/14.0/common/internet `
  DoNotCheckIfOfficeIsHTMLEditor 1 -t dword

# smplayer option for folders
ni hklm:software/classes/directory/shell/smplayer/command `
  -f -t expandstring -va '"%programfiles(x86)%/smplayer/smplayer" "%1"'

# bash option
foreach ($key in '', 'background/') {
  ni hklm:software/classes/directory/${key}shell/bash/command `
    -f -t expandstring -va 'cmd /c cd %v & start %homedrive%/cygwin64/bin/bash'
}

# QuickEdit
# - mouse scroll
# - right click paste
# - select text with mouse
sp hkcu:console quickedit 1
sp hkcu:console WindowPosition 0x01900384

# shortcut extension remove
sp hkcu:software/microsoft/windows/currentversion/explorer `
  link ([byte[]](0,0,0,0))

# desktop background remove picture location history
$0 = 'hkcu:software/microsoft/windows/currentversion/explorer/wallpapers/images'
ni $0 -f
rd $0

# clear internet explorer browsing history
sp 'hkcu:software/microsoft/internet explorer/main/windowssearch' `
  EnabledScopes 0
rundll32 inetcpl.cpl ClearMyTracksByProcess 1

# the non "system" variables are brittle
$0 =
  '%systemdrive%/program files/7-zip',
  '%systemdrive%/program files/imagemagick',
  '%systemroot%/system32',
  '%systemroot%/system32/windowspowershell/v1.0'
sp 'hklm:system/currentcontrolset/control/session manager/environment' `
  path ($0 -join ';')
kill -n explorer
