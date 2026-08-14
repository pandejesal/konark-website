$ErrorActionPreference = "Stop"
$env:GITHUB_TOKEN = ""
gh pr merge 6 --repo pandejesal/konark-website --merge --delete-branch
Write-Output "MERGE EXIT: $LASTEXITCODE"
