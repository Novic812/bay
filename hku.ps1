$usr = read-host 'Enter user'
$sid =
ls 'hklm:/software/microsoft/windows nt/currentversion/profilelist' | ? {
  $_.getvalue('profileimagepath') -match $usr
} | select -exp pschildname
cd registry::hku

# stackoverflow.com/q/4491999
"$sid/software/microsoft/windows/currentversion/explorer/advanced" | % {
  sp -vb $_ HideFileExt 0
}

# superuser.com/q/547832
"$sid/software/microsoft/office/15.0/common/graphics" | % {
  ni -f $_
  sp -vb $_ DisableAnimations 1
}

'Press Enter to continue, then log off...'
read-host
