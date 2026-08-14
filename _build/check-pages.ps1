# CHECK REPO PAGES STATUS + BRANCHES
$clone = Join-Path $env:TEMP "opencode\konark-sync"
gh api repos/pandejesal/konark-website/pages 2>&1 | Out-String
Write-Output "---BRANCHES---"
cmd /c "set GITHUB_TOKEN=&& git -C `"$clone`" ls-remote --heads origin" 2>&1