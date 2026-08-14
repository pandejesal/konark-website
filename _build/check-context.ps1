# CHECK CONTEXT FILES IN REPO
$clone = Join-Path $env:TEMP "opencode\konark-sync"
$candidates = @(
    "00-MASTER-CAMPAIGN.md", "marketing\00-MASTER-CAMPAIGN.md",
    "phase3-content\linkedin", "marketing\phase3-content\linkedin",
    "marketing\linkedin", "linkedin",
    "marketing\google-business", "google-business",
    "marketing\case-studies", "case-studies",
    "marketing\lead-log", "lead-log", "phase4-leadengine",
    "marketing\directory-announcements"
)
foreach ($c in $candidates) {
    $p = Join-Path $clone $c
    if (Test-Path $p) { Write-Output ("FOUND: " + $c) }
}
$root = Get-ChildItem $clone | Select-Object -ExpandProperty Name
Write-Output ("ROOT ENTRIES: " + ($root -join ", "))