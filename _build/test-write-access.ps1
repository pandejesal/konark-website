# TEST WRITE ACCESS - dry-run push (no actual push happens)
$clone = Join-Path $env:TEMP "opencode\konark-sync"
if (-not (Test-Path $clone)) { Write-Output "NO CLONE"; exit }
git -C $clone fetch origin main 2>&1 | Out-Null
git -C $clone push --dry-run origin HEAD:refs/heads/scratch-write-test 2>&1
Write-Output ("EXITCODE: " + $LASTEXITCODE)
if ($LASTEXITCODE -eq 0) { Write-Output "WRITE ACCESS: OK (dry-run passed)" } else { Write-Output "WRITE ACCESS: NO (dry-run failed)" }
git -C $clone ls-remote origin refs/heads/scratch-write-test 2>&1 | Out-Null
Write-Output ("SCRATCH BRANCH EXISTS (should be empty): " + $LASTEXITCODE)