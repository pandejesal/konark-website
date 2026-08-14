# CHECK ASCII - verify all article markdown files are ASCII-only (PS 5.1 rule)
Get-ChildItem "C:\Users\DELL\Desktop\Dad marketing\phase3-content\whale-program\authority-content\article-*.md" | ForEach-Object {
    $c = Get-Content $_.FullName -Raw
    $nonAscii = [regex]::Matches($c, '[^\u0000-\u007F]') | ForEach-Object { $_.Value } | Select-Object -Unique
    if ($nonAscii) { Write-Output ($_.Name + ": NON-ASCII: " + ($nonAscii -join ",")) }
    else { Write-Output ($_.Name + ": ASCII OK") }
}