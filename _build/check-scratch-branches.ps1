# VERIFY NO SCRATCH BRANCHES WERE CREATED
$clone = Join-Path $env:TEMP "opencode\konark-sync"
cmd /c "set GITHUB_TOKEN=&& git -C `"$clone`" ls-remote origin `"refs/heads/scratch-write-test*`"" 2>&1
Write-Output ("EXITCODE: " + $LASTEXITCODE + " (empty output = clean)")