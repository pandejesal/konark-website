# CLEANUP - remove debug scripts from _build
$build = "C:\Users\DELL\Desktop\Dad marketing\website\_build"
$debug = @("debug-jsonld.ps1", "debug2-jsonld.ps1", "debug3-jsonld.ps1", "list-files.ps1")
foreach ($f in $debug) {
    $p = Join-Path $build $f
    if (Test-Path $p) { Remove-Item $p -Force }
}
Write-Output "DEBUG SCRIPTS REMOVED"