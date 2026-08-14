# CHECK REPO CLONE LAYOUT
$clone = Join-Path $env:TEMP "opencode\konark-sync"
if (Test-Path $clone) {
    Write-Output "CLONE EXISTS: $clone"
    if (Test-Path (Join-Path $clone "weekly-batch")) { Write-Output "HAS: weekly-batch (root)" }
    if (Test-Path (Join-Path $clone "marketing\weekly-batch")) { Write-Output "HAS: marketing\weekly-batch" }
    if (Test-Path (Join-Path $clone "00-MASTER-CAMPAIGN.md")) { Write-Output "HAS: 00-MASTER-CAMPAIGN.md (root)" }
    if (Test-Path (Join-Path $clone "marketing\00-MASTER-CAMPAIGN.md")) { Write-Output "HAS: marketing\00-MASTER-CAMPAIGN.md" }
    if (Test-Path (Join-Path $clone "phase3-content")) { Write-Output "HAS: phase3-content (root)" }
    if (Test-Path (Join-Path $clone "marketing\phase3-content")) { Write-Output "HAS: marketing\phase3-content" }
    if (Test-Path (Join-Path $clone "linkedin")) { Write-Output "HAS: linkedin (root)" }
    if (Test-Path (Join-Path $clone "marketing\linkedin")) { Write-Output "HAS: marketing\linkedin" }
    $d = Get-ChildItem $clone -Directory | Select-Object -ExpandProperty Name
    Write-Output ("TOP DIRS: " + ($d -join ", "))
} else {
    Write-Output "NO CLONE AT $clone"
}