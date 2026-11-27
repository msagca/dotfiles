$ErrorActionPreference = 'Stop'
$dotDir = $PSScriptRoot
$userConfig = Join-Path $HOME '.config'

function Get-LinkTarget {
    param([System.IO.FileSystemInfo]$Item)
    $target = @($Item.Target)[0]
    if (-not $target) { return $null }
    return ($target -replace '^\\(\\\?|\?\?)\\', '').TrimEnd('\')
}

function New-DotLink {
    param([string]$Name, [string]$Destination)
    $source = Join-Path $dotDir $Name
    if ([System.IO.Path]::GetFullPath($Destination).TrimEnd('\') -eq $source.TrimEnd('\')) {
        throw "refusing to link '$source' onto itself"
    }
    $item = Get-Item -LiteralPath $Destination -Force -ErrorAction SilentlyContinue
    if ($item) {
        if ($item.LinkType -and ((Get-LinkTarget $item) -eq $source.TrimEnd('\'))) {
            Write-Host "'$Destination' -> '$source' (already linked)"
            return
        }
        $backup = "$Destination.bak-$(Get-Date -Format 'yyyyMMddHHmmss')"
        Move-Item -LiteralPath $Destination -Destination $backup
        Write-Warning "moved existing '$Destination' to '$backup'"
    }
    New-Item -ItemType Directory -Force -Path (Split-Path $Destination) | Out-Null
    New-Item -ItemType Junction -Path $Destination -Target $source | Out-Null
    Write-Host "'$Destination' -> '$source'"
}

function Add-Line {
    param([string]$Line, [string]$Path)
    New-Item -ItemType Directory -Force -Path (Split-Path $Path) | Out-Null
    $content = ''
    if (Test-Path -LiteralPath $Path) {
        $content = [System.IO.File]::ReadAllText($Path)
        if (($content -split "\r?\n") -contains $Line) { return }
    }
    $prefix = ''
    if ($content -and -not $content.EndsWith("`n")) { $prefix = "`n" }
    [System.IO.File]::AppendAllText($Path, "$prefix$Line`n")
}

New-DotLink 'nvim' (Join-Path $env:LOCALAPPDATA 'nvim')
New-DotLink 'oh-my-posh' (Join-Path $userConfig 'oh-my-posh')
New-DotLink 'alacritty' (Join-Path $env:APPDATA 'alacritty')

$nuConfigHome = $env:APPDATA
if ($env:XDG_CONFIG_HOME) {
    $nuConfigHome = $env:XDG_CONFIG_HOME
}
New-DotLink 'nushell' (Join-Path $nuConfigHome 'nushell')

$bashrc = Join-Path $HOME '.bashrc'
Add-Line 'export VIRTUAL_ENV_DISABLE_PROMPT=1' $bashrc
Add-Line 'command -v oh-my-posh >/dev/null && eval "$(oh-my-posh init bash --config "$HOME/.config/oh-my-posh/msagca.omp.json")"' $bashrc

$pwsh = Get-Command pwsh -ErrorAction SilentlyContinue
if ($pwsh) {
    $pwshProfile = (& $pwsh.Source -NoProfile -Command '$PROFILE').Trim()
    Add-Line '$env:VIRTUAL_ENV_DISABLE_PROMPT = 1' $pwshProfile
    Add-Line 'if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) { oh-my-posh init pwsh --config "$HOME/.config/oh-my-posh/msagca.omp.json" | Invoke-Expression }' $pwshProfile

    $themeSync = Join-Path $env:APPDATA 'alacritty\theme-sync.ps1'
    & $pwsh.Source -NoProfile -ExecutionPolicy Bypass -File $themeSync -Once
    $startup = [Environment]::GetFolderPath('Startup')
    $shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut((Join-Path $startup 'Alacritty Theme Sync.lnk'))
    $shortcut.TargetPath = Join-Path $env:SystemRoot 'System32\conhost.exe'
    $shortcut.Arguments = "--headless `"$($pwsh.Source)`" -NoProfile -ExecutionPolicy Bypass -File `"$themeSync`""
    $shortcut.WorkingDirectory = Join-Path $env:APPDATA 'alacritty'
    $shortcut.WindowStyle = 7
    $shortcut.Save()
    Write-Host "startup shortcut for '$themeSync' created"
}
else {
    Write-Warning 'pwsh not found: skipped the PowerShell 7 profile and the Alacritty theme sync'
}
