${0+: \} <#}
rp=$(realpath "$0")
cg=$(cygpath -w "$rp")
exec powershell "&'$cg'" $*
#>
# This will change the default action for some types, but that should not be an
# issue. Those changed types can still access the other program from right
# click menu.
$keys = 'batfile', 'cmdfile', 'cssfile', 'firefoxhtml', 'inifile', 'jsfile',
        'microsoft.powershellscript.1', 'msinfofile', 'regfile', 'txtfile',
        'unknown', 'xmlfile'
foreach ($key in $keys) {
  sp hklm:/software/classes/$key/shell '(default)' edit
  cd hklm:/software/classes/$key/shell/edit/command
  ni . -f -va ('"{0}" %1' -f "$env:programfiles/notepad2/notepad2")
}
cd hkcu:/software/microsoft/office/14.0/common/internet
sp . DoNotCheckIfOfficeIsHTMLEditor 1 -t dword

# shell options
cd hklm:/software/classes
foreach ($key in 'directory', 'directory/background', 'drive') {
  $0 = (gi $pshome/powershell.exe).fullname
  ni $key/shell/powershell/command -f -va "$0 -noe cd '%v'"

  $0 = (gi $env:homedrive/cygwin64/bin/cygstart.exe).fullname
  ni $key/shell/bash/command -f -va "$0 -d '%v' /bin/bash"
}

# QuickEdit
# - mouse scroll
# - right click paste
# - select text with mouse
cd hkcu:/console
$0 = '%systemroot%_system32_windowspowershell_v1.0_powershell.exe'
ni $0 -f
sp $0 ColorTable00   0x00562401
sp $0 ColorTable07   0x00f0edee
sp  . QuickEdit      0x00000001
sp  . WindowPosition 0x01900384

# shortcut extension remove
cd hkcu:/software/microsoft/windows/currentversion/explorer
sp . link ([byte[]](0,0,0,0))

# desktop background remove picture location history
cd hkcu:/software/microsoft/windows/currentversion/explorer/wallpapers
if (test-path images) {rd images}

# clear internet explorer browsing history
cd 'hkcu:/software/microsoft/internet explorer/main/windowssearch'
sp . EnabledScopes 0
rundll32 inetcpl.cpl ClearMyTracksByProcess 1

# environment
$0 =
  "${env:homedrive}/shell/bin",      # ffmpeg
  "${env:programfiles}/imagemagick", # ffmpeg
  "${env:programfiles}/7-zip",
  "${env:programfiles(x86)}/winamp",
  "${env:windir}/system32",
  "${pshome}"
cd 'hklm:/system/currentcontrolset/control/session manager/environment'
sp . PATH   ($0 -join ';')
sp . CYGWIN nodosfilewarning
kill -n explorer
