pushd
function warn {
  write-host -f yellow "`n$args"
}

function not {
  param ($cm, $pm)
  if (& $cm $pm) {0} else {1}  
}

$sz, $ph, $fd = switch ($env:processor_architecture) {
  amd64 {'7z920-x64.msi', '/Base/x86_64', 'msys64'}
  x86   {'7z920.msi',     '/Base/i686',   'msys32'}
}

md -f $env:appdata/msys2
cd $env:appdata/msys2

# 7-zip
$env:path = '/program files/7-zip'
if (not test-path $env:path) {
  curl -outfile $sz dl.7-zip.org/$sz
  & ./$sz -q
}

warn 'Checking latest version...'
[xml] $xml = curl sourceforge.net/projects/msys2/rss?path=$ph
$?
$bu = ($xml.rss.channel.item.link | sls tar).line[0]
$bo = $bu.split('/')[-2]

if (not test-path $bo) {
  "$fd", "/$fd" | % {
    if (test-path $_) {
      rm -r $_
    }
  }
  curl -useragent . -outfile $bo $bu
}

if (not test-path $fd) {
  7z x $bo
  7z x (gi $bo).basename
}

warn 'Checking files...'
if (not test-path /$fd) {
  cp -r $fd /
}
popd
