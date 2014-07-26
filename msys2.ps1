pushd
function warn {
  write-host -f yellow "`n$args"
}

function not {
  param ($cm, $pm)
  if (& $cm $pm) {0} else {1}  
}

$sz, $ph, $fd = switch ($env:processor_architecture) {
  amd64 {'7z920-x64.msi', 'x86_64', 'msys64'}
  x86   {'7z920.msi',     'i686',   'msys32'}
}

md -f $env:appdata/msys2
cd $env:appdata/msys2

# 7-zip
'/program files/7-zip' | % {
  $env:path += ";$_"
  if (not test-path $_) {
    curl -outfile $sz dl.7-zip.org/$sz
    & ./$sz -q
  }
}

warn 'Checking latest version...'
$bu = curl sourceforge.net/projects/msys2/files/Base/$ph |
  select -exp links | ? href -match tar | select -f 1 -exp href
$bo = $bu.split('/')[-2]

if (not test-path $bo) {
  if (test-path $fd) {
    rm -r $fd
  }
  curl -useragent . -outfile $bo $bu
}

if (not test-path $fd) {
  7z x $bo
  7z x (gi $bo).basename
}

robocopy -mir $fd $env:homedrive/$fd
popd
