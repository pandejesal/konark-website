# VALIDATE JSON-LD - extract and parse every ld+json block on every page
$root = "C:\Users\DELL\Desktop\Dad marketing\website"
$bad = 0
Get-ChildItem $root -Recurse -Include *.html | ForEach-Object {
    $c = Get-Content $_.FullName -Raw
    $m = [regex]::Matches($c, '<script type="application/ld\+json">(.*?)</script>', [System.Text.RegularExpressions.RegexOptions]::Singleline)
    foreach ($x in $m) {
        $json = $x.Groups[1].Value.Trim()
        try { $null = $json | ConvertFrom-Json } catch { $bad++; Write-Output ("BAD JSON-LD: " + $_.Name) }
    }
}
if ($bad -eq 0) { Write-Output "ALL JSON-LD BLOCKS PARSE OK" }