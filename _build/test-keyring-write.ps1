# TEST KEYRING TOKEN WRITE ACCESS - clear GITHUB_TOKEN env, dry-run push
$clone = Join-Path $env:TEMP "opencode\konark-sync"
if (-not (Test-Path $clone)) { Write-Output "NO CLONE"; exit }
cmd /c "set GITHUB_TOKEN=&& git -C `"$clone`" push --dry-run origin HEAD:refs/heads/scratch-write-test2" 2>&1
Write-Output ("EXITCODE: " + $LASTEXITCODE)