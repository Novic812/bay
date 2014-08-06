pushd
# need if you call from start menu
cp $PSScriptRoot/profile.ps1 $pshome

# app paths
cd 'hklm:/software/microsoft/windows/currentversion/app paths'
ni -f -va (cvpa $pshome/powershell.exe) powershell.exe
ni -f -va (cvpa $env:windir/system32/wbem/wmic.exe) wmic.exe
ni -f -va (cvpa $env:programfiles/notepad2/notepad2.exe) notepad2.exe

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
  si $k1 $k2
  sp $k1 perceivedtype $null
  ni -f $k2/shell
  cd $k2/shell
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
'directory', 'directory/background', 'drive' | % {
  cd hklm:/software/classes/$_/shell
  cvpa $pshome/powershell.exe, $env:homedrive/cygwin64/bin/bash.exe | % {
    (get-item $_).basename |
      & {ni -f -va "wmic process call create $_,'%v'" $input/command}
  }
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
$ph = & {
  "$env:appdata/shell/bin"
  "$env:homedrive/repos/a/misc"
  "$env:windir/system32"
  "$pshome"
} | cvpa
[environment]::setenvironmentvariable('PATH', $ph -join ';', 'm')
[environment]::setenvironmentvariable('CYGWIN', 'nodosfilewarning', 'm')

# clear internet explorer browsing history
cd 'hkcu:/software/microsoft/internet explorer/main'
sp windowssearch EnabledScopes 0
rundll32 inetcpl.cpl ClearMyTracksByProcess 1
popd
