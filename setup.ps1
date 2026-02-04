function New-SafeSymlink {
  param(
    [Parameter(Mandatory)]
    [string]$Source,
    [Parameter(Mandatory)]
    [string]$Target
  )
  if (-not (Test-Path $Source)) {
    Write-Host "Source does not exist: $Source"
    return
  }
  $TargetDir = Split-Path -Parent $Target
  if (-not (Test-Path $TargetDir)) {
    try {
      New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
      Write-Host "Created missing directory: $TargetDir"
    }
    catch {
      Write-Host "Failed to create directory: $TargetDir"
      Write-Host $_.Exception.Message
      return
    }
  }
  if (Test-Path $Target) {
    Write-Host "Target already exists: $Target"
    Write-Host "Skipping symlink creation..."
  }
  else {
    try {
      New-Item -ItemType SymbolicLink -Path $Target -Target $Source -ErrorAction Stop | Out-Null
      Write-Host "Symlink created: $Target -> $Source"
    }
    catch {
      Write-Host "Failed to create symlink: $Target -> $Source"
      Write-Host $_.Exception.Message
    }
  }
}
$UserAppData = Join-Path $env:USERPROFILE "AppData\Local"
$UserDocs = Join-Path $env:USERPROFILE "Documents"
$DotPath = $MyInvocation.MyCommand.Path
$DotDir = Split-Path -Parent (Resolve-Path $DotPath)
$DotNvim = Join-Path $DotDir "nvim"
$DotOMP = Join-Path $DotDir "ohmyposh.json"
$DotPS = Join-Path $DotDir "Microsoft.PowerShell_profile.ps1"
$UserNvim = Join-Path $UserAppData "nvim"
$UserOMP = Join-Path $UserAppData "ohmyposh.json"
$UserPS = Join-Path $UserDocs "PowerShell\Microsoft.PowerShell_profile.ps1"
New-SafeSymlink -Source $DotNvim -Target $UserNvim
New-SafeSymlink -Source $DotOMP -Target $UserOMP
New-SafeSymlink -Source $DotPS -Target $UserPS
