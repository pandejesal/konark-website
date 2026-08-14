$ErrorActionPreference = "Stop"
$env:GITHUB_TOKEN = ""
$files = gh pr view 6 --repo pandejesal/konark-website --json files --jq '.files[].path'
Write-Output "=== FILES ==="
$files
Write-Output "=== CHANGELOG ==="
gh pr view 6 --repo pandejesal/konark-website --json title,body --jq '.title + "`n" + .body'
