$ErrorActionPreference = "Stop"
$env:GITHUB_TOKEN = ""
$repo = "C:\Users\DELL\AppData\Local\Temp\opencode\konark-sync"
git -C $repo checkout -B main origin/main
if ($LASTEXITCODE -ne 0) { throw "checkout main failed" }
git -C $repo cherry-pick 42dc16d
if ($LASTEXITCODE -ne 0) { throw "cherry-pick failed" }
git -C $repo push origin main
if ($LASTEXITCODE -ne 0) { throw "push failed" }
Write-Output "PUSH OK"
