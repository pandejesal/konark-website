$ErrorActionPreference = "Stop"
$repo = "C:\Users\DELL\AppData\Local\Temp\opencode\konark-sync"
$files = @(
    "marketing/weekly-batch/W17/linkedin-posts.md", "marketing/weekly-batch/W17/gbp-post.md", "marketing/weekly-batch/W17/engagement-list.md",
    "marketing/weekly-batch/W18/linkedin-posts.md", "marketing/weekly-batch/W18/gbp-post.md", "marketing/weekly-batch/W18/engagement-list.md",
    "marketing/weekly-batch/W19/linkedin-posts.md", "marketing/weekly-batch/W19/gbp-post.md", "marketing/weekly-batch/W19/engagement-list.md",
    "marketing/weekly-batch/W20/linkedin-posts.md", "marketing/weekly-batch/W20/gbp-post.md", "marketing/weekly-batch/W20/engagement-list.md"
)
$emoji = "[\uD800-\uDBFF][\uDC00-\uDFFF]"
$issues = @()
foreach ($f in $files) {
    $content = git -C $repo show ("FETCH_HEAD:" + $f)
    $text = ($content -join "`n")
    if ($text -match $emoji) { $issues += "EMOJI: $f" }
    if ($text -notmatch "Insert website link after deployment") { $issues += "NO-PLACEHOLDER: $f" }
    if ($text -match "#[A-Za-z0-9]+.*#[A-Za-z0-9]+.*#[A-Za-z0-9]+.*#[A-Za-z0-9]+") { $issues += "4PLUS-HASHTAGS: $f" }
    if ($f -match "linkedin-posts" -and $text -notmatch "\[TO CONFIRM") { $issues += "NO-TO-CONFIRM: $f" }
    if ($text -notmatch "89053.?78147|8905378147") { $issues += "NO-PHONE: $f" }
    if ($text -notmatch "konarkinstruments@gmail.com") { $issues += "NO-EMAIL: $f" }
}
if ($issues.Count -eq 0) { Write-Output "ALL 12 FILES POLICY-CLEAN" } else { $issues | ForEach-Object { Write-Output $_ } }
