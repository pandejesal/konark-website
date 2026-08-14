$ErrorActionPreference = "Stop"

$roots = @(
    "C:\Users\DELL\Desktop\Dad marketing\website",
    "C:\Users\DELL\Desktop\Dad marketing\phase1-kit",
    "C:\Users\DELL\Desktop\Dad marketing\phase3-content",
    "C:\Users\DELL\Desktop\Dad marketing\phase4-leadengine",
    "C:\Users\DELL\Desktop\Dad marketing\phase5-export",
    "C:\Users\DELL\Desktop\Dad marketing\UNBLOCK-CHECKLIST.md",
    "C:\Users\DELL\Desktop\Dad marketing\SKILL-CONFIG-NOTES.md"
)

$files = @()
foreach ($root in $roots) {
    if (Test-Path -LiteralPath $root -PathType Container) {
        $files += Get-ChildItem -LiteralPath $root -Recurse -File -Include *.html,*.xml,*.txt,*.md,*.ps1,*.js,*.csv | Where-Object { $_.FullName -notmatch '\\\.git\\' }
    } elseif (Test-Path -LiteralPath $root -PathType Leaf) {
        $files += Get-Item -LiteralPath $root
    }
}

$old = "konarkprocessinstruments.com"
$new = "konarkprocessinstruments.com"
$changed = @()

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f.FullName)
    if ($content.Contains($old)) {
        $newContent = $content.Replace($old, $new)
        [System.IO.File]::WriteAllText($f.FullName, $newContent)
        $changed += $f.FullName
    }
}

Write-Output ("CHANGED: " + $changed.Count)
$changed | ForEach-Object { Write-Output $_ }
