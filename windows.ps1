# need if you call from start menu
cp $PSScriptRoot/profile.ps1 $pshome

# app paths
cd 'hklm:software/microsoft/windows/currentversion/app paths'
ni -f -va (join-path $env:homedrive cygwin64/bin/cygstart) cygstart.exe
ni -f -va (join-path $env:programfiles notepad2/notepad2) notepad2.exe
ni -f -va (join-path $pshome powershell) powershell.exe

# Notepad2
$run = @{
  '.css'    = 'cssfile',                      $null
  '.ini'    = 'inifile',                      $null
  '.nfo'    = 'txtfile',                      $null
  '.txt'    = 'txtfile',                      $null
  'unknown' = 'unknown',                      $null
  '.bat'    = 'batfile',                      '"%1" %*'
  '.cmd'    = 'cmdfile',                      '"%1" %*'
  '.htm'    = 'firefoxhtml',                  'firefox "%1"'
  '.xml'    = 'firefoxhtml',                  'firefox "%1"'
  '.ps1'    = 'microsoft.powershellscript.1', 'powershell "%1"'
  '.reg'    = 'regfile',                      'regedit "%1"'
  '.js'     = 'jsfile',                       'wscript "%1"'
}
$run.GetEnumerator() | % {
  $k1 = $_.key
  $k2 = $_.value[0]
  $pm = $_.value[1]
  cd hklm:/software/classes
  sp $k1 'perceivedtype' $null
  sp $k1 '(default)'     $k2
  ni -f "$k2/shell"
  cd "$k2/shell"
  if ($pm) {
    ni -va Run 0
    ni -va $pm 0/command
  }
  ni -va Edit 1
  ni -va 'notepad2 "%1"' 1/command
  ni -va Open 2
  ni -va 'notepad "%1"' 2/command
}
cd hkcu:/software/microsoft/office/14.0/common
sp internet DoNotCheckIfOfficeIsHTMLEditor 1 -t d

# shell options
cd hklm:/software/classes
foreach ($key in 'directory', 'directory/background', 'drive') {
  # must be single quote
  ni $key/shell/bash/command -f -va "cygstart -d '%v' /bin/bash"
  ni $key/shell/powershell/command -f -va "powershell -noe cd '%v'"
}

# Console
$pw = '%systemroot%_system32_windowspowershell_v1.0_powershell.exe'
cd hkcu:/
sp console QuickEdit      0x00000001
sp console WindowPosition 0x01900384
cd console
ni -f $pw
sp $pw ColorTable00 0x00562401
sp $pw ColorTable07 0x00f0edee

# shortcut extension remove
cd hkcu:/software/microsoft/windows/currentversion
sp explorer link ([byte[]](0,0,0,0))

# desktop background remove picture location history
cd hkcu:/software/microsoft/windows/currentversion/explorer/wallpapers
if (test-path images) {rd images}

# need homedrive for man
$ph =
  "$env:homedrive/repos/apt-cyg",
  "$env:homedrive/shell/bin",
  "$env:homedrive/windows/system32",
  "$env:homedrive/windows/system32/windowspowershell/v1.0"
[environment]::setenvironmentvariable('PATH', $ph -join ';', 'm')
[environment]::setenvironmentvariable('CYGWIN', 'nodosfilewarning', 'm')

# clear internet explorer browsing history
cd 'hkcu:/software/microsoft/internet explorer/main'
sp windowssearch EnabledScopes 0
rundll32 inetcpl.cpl ClearMyTracksByProcess 1
