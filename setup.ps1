$Source = $MyInvocation.MyCommand.Path
$SourceDir = Split-Path -Parent (Resolve-Path $Source)
$SourceNvim = Join-Path $SourceDir "nvim"
$TargetDir = Join-Path $env:USERPROFILE "AppData\Local\nvim"
if (Test-Path $TargetDir)
{
	Write-Host "Target already exists: $TargetDir"
	Write-Host "Skipping symlink creation..."
} else
{
	New-Item -ItemType SymbolicLink -Path $TargetDir -Target $SourceNvim
	Write-Host "Symlink created: $TargetDir -> $SourceNvim"
}
