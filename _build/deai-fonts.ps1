$ErrorActionPreference = "Stop"
$root = "C:\Users\DELL\Desktop\Dad marketing\website"
$old = "family=Inter:wght@400;500;600;700&family=Rajdhani:wght@500;600;700&family=Source+Serif+4:opsz,wght@8..60,400;8..60,600;8..60,700&display=swap"
$new = "family=Inter:wght@400;500;600;700&family=IBM+Plex+Mono:wght@400;500;600&display=swap"
$files = Get-ChildItem -Path $root -Recurse -Filter "*.html"
$count = 0
foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    if ($content.Contains($old)) {
        $content = $content.Replace($old, $new)
        [System.IO.File]::WriteAllText($f.FullName, $content)
        Write-Output ("UPDATED " + $f.FullName)
        $count++
    } else {
        Write-Output ("SKIP (no match) " + $f.FullName)
    }
}
Write-Output ("TOTAL UPDATED: " + $count)
