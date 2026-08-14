# LIST REPO MARKETING LAYOUT
$clone = Join-Path $env:TEMP "opencode\konark-sync"
$m = Join-Path $clone "marketing"
Get-ChildItem $m -Recurse -File | ForEach-Object { $_.FullName.Replace($clone + "\", "") }