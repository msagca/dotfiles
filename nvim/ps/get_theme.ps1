$theme = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize").AppsUseLightTheme
if ($theme -eq 0) {
  Write-Output "dark"
} else {
  Write-Output "light"
}
