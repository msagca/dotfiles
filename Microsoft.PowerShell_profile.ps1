$OhMyPoshExe = Get-Command "oh-my-posh" -ErrorAction SilentlyContinue
$UserConfig = Join-Path $env:USERPROFILE "AppData\Local\ohmyposh.json"
if ($OhMyPoshExe) {
  if (Test-Path $UserConfig) {
    oh-my-posh init pwsh --config $UserConfig | Invoke-Expression
  }
  else {
    oh-my-posh init pwsh | Invoke-Expression
  }
}
