function Prompt {
  "`n{0}`nPS > " -f (Get-Location).Path
}

function c {
  Clear-Host
}

function grep {
  $input | Out-String -Stream | Select-String $args
}
