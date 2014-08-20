# Load Hive
$usr = read-host 'Enter user'
cd registry::hku

join-path hku $usr | % {
  reg load $_ /users/$usr/ntuser.dat

  # stackoverflow.com/q/4491999
  "$usr/software/microsoft/windows/currentversion/explorer/advanced" | % {
    sp -vb $_ HideFileExt 0
  }

  # superuser.com/q/547832
  "$usr/software/microsoft/office/15.0/common/graphics" | % {
    ni -f $_
    sp -vb $_ DisableAnimations 1
  }
  reg unload $_
}

'Press Enter to continue, then log off...'
read-host
