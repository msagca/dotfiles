param(
    [string]$Light = 'catppuccin-latte',
    [string]$Dark = 'catppuccin-mocha',
    [switch]$Once
)

$ErrorActionPreference = 'Stop'
$themes = Join-Path $PSScriptRoot 'themes'
$target = Join-Path $themes 'current.toml'
$keyPath = 'Software\Microsoft\Windows\CurrentVersion\Themes\Personalize'

function Sync-AlacrittyTheme {
    $isLight = (Get-ItemProperty -Path "HKCU:\$keyPath" -ErrorAction SilentlyContinue).AppsUseLightTheme -eq 1
    $source = Join-Path $themes "$($isLight ? $Light : $Dark).toml"
    $content = Get-Content -Path $source -Raw
    if (-not (Test-Path $target) -or (Get-Content -Path $target -Raw) -ne $content) {
        Set-Content -Path $target -Value $content -NoNewline
    }
}

Sync-AlacrittyTheme
if ($Once) { return }

$mutex = [System.Threading.Mutex]::new($false, 'Local\AlacrittyThemeSync')
if (-not $mutex.WaitOne(0)) { return }

$sid = [System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value
$wqlKey = "$sid\$keyPath".Replace('\', '\\')
$query = "SELECT * FROM RegistryValueChangeEvent WHERE Hive='HKEY_USERS' AND KeyPath='$wqlKey' AND ValueName='AppsUseLightTheme'"
Register-CimIndicationEvent -Query $query -SourceIdentifier AlacrittyThemeSync | Out-Null

while ($true) {
    $evt = Wait-Event -SourceIdentifier AlacrittyThemeSync
    Remove-Event -EventIdentifier $evt.EventIdentifier
    Sync-AlacrittyTheme
}
