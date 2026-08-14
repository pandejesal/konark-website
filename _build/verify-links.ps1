# VERIFY SITE - check all local href/src references resolve to existing files
# ASCII-only (PowerShell 5.1)
$root = "C:\Users\DELL\Desktop\Dad marketing\website"
$html = Get-ChildItem $root -Recurse -Include *.html
$missing = @()
foreach ($f in $html) {
    $dir = $f.DirectoryName
    $content = Get-Content $f.FullName -Raw
    $refs = [regex]::Matches($content, '(?:href|src)="([^"#]+)')
    foreach ($m in $refs) {
        $ref = $m.Groups[1].Value
        if ($ref -match '^(https?:|mailto:|tel:|wa\.me|data:)') { continue }
        $target = [System.IO.Path]::GetFullPath((Join-Path $dir $ref))
        if (-not (Test-Path $target)) {
            $missing += ("MISSING: " + $f.FullName.Substring($root.Length) + " -> " + $ref)
        }
    }
    $ids = [regex]::Matches($content, 'id="([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
    $hashRefs = [regex]::Matches($content, 'href="#([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
    foreach ($h in $hashRefs) {
        if ($ids -notcontains $h) { $missing += ("MISSING ANCHOR: " + $f.FullName.Substring($root.Length) + " -> #" + $h) }
    }
}
if ($missing.Count -eq 0) { Write-Output "ALL LINKS OK (" + $html.Count + " pages checked)" }
else { $missing | ForEach-Object { Write-Output $_ } }