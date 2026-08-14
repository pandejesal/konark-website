$ErrorActionPreference = "Stop"
$env:GITHUB_TOKEN = ""
$repo = "C:\Users\DELL\AppData\Local\Temp\opencode\konark-sync"
git -C $repo add -A
if ($LASTEXITCODE -ne 0) { throw "git add failed" }
git -C $repo commit -m "Add GSTIN to footer (all pages), JSON-LD taxID, llms.txt"
if ($LASTEXITCODE -ne 0) { throw "git commit failed" }
git -C $repo push origin main
if ($LASTEXITCODE -ne 0) { throw "git push failed" }
Write-Output "PUSH OK"
