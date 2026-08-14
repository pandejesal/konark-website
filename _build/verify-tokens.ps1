# VERIFY TOKENS - check for unreplaced template tokens and JSON-LD presence
Get-ChildItem "C:\Users\DELL\Desktop\Dad marketing\website" -Recurse -Include *.html | ForEach-Object {
    $c = Get-Content $_.FullName -Raw
    $tokens = [regex]::Matches($c, '__[A-Z]+__') | ForEach-Object { $_.Value } | Select-Object -Unique
    if ($tokens) { Write-Output ($_.Name + ": UNREPLACED TOKENS: " + ($tokens -join ",")) }
    if ($c -notmatch 'application/ld\+json') { Write-Output ($_.Name + ": NO JSON-LD") }
    if ($_.Name -ne "index.html" -and $_.FullName -notmatch 'articles' -and $c -notmatch 'articles/index.html') { Write-Output ($_.Name + ": NAV MISSING ARTICLES LINK") }
}
Write-Output "TOKEN CHECK DONE"