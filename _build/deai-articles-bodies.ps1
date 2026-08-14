$ErrorActionPreference = 'Stop'
$articlesDir = 'C:\Users\DELL\Desktop\Dad marketing\website\articles'
$files = @(
  'commissioning-checklist.html',
  'dg-set-automation.html',
  'interlock-philosophy.html',
  'panel-fabrication.html',
  'relay-to-plc-upgrade.html',
  'self-recuperative-burners.html',
  'tundish-heating.html'
)
$rxList = [regex]'(<ol><li>)(.*?)(</li></ol><p>)(.*?)(</p>)'

foreach ($f in $files) {
  $path = Join-Path $articlesDir $f
  $lines = [System.IO.File]::ReadAllLines($path)
  $bodyIdx = -1
  for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i].Contains('<h2>')) { $bodyIdx = $i; break }
  }
  if ($bodyIdx -lt 0) { Write-Host "SKIP (no body): $f"; continue }

  $body = $lines[$bodyIdx]
  $dashBefore = ([regex]::Matches($body, ' - ')).Count

  $body = $body -replace '<h2>The Konark position \([^)]*\)</h2><blockquote>', '<blockquote>'
  $body = $body -replace '" - Nilesh Pande', '" Nilesh Pande'

  $listFixes = 0
  $body = $rxList.Replace($body, {
    param($m)
    $script:listFixes++
    $first = $m.Groups[2].Value -replace '^\d+\.\s*', ''
    $items = [regex]::Split($m.Groups[4].Value, '(?=\d+\.\s)') | Where-Object { $_.Trim().Length -gt 0 }
    $out = '<ol><li>' + $first + '</li>'
    foreach ($it in $items) {
      $out += '<li>' + ($it -replace '^\d+\.\s*', '') + '</li>'
    }
    $out + '</ol>'
  })

  $body = $body -replace ' - ', ', '
  $lines[$bodyIdx] = $body

  for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($i -eq $bodyIdx) { continue }
    if ($lines[$i] -match 'description') {
      $lines[$i] = $lines[$i] -replace ' - ', ', '
    } elseif ($lines[$i] -match 'cta-sub') {
      $lines[$i] = $lines[$i] -replace 'engineer - call', 'engineer: call'
    } elseif ($lines[$i] -match 'Ahmedabad, India - ') {
      $lines[$i] = $lines[$i] -replace 'Ahmedabad, India - ', 'Ahmedabad, India. '
    }
  }

  [System.IO.File]::WriteAllLines($path, $lines, (New-Object System.Text.UTF8Encoding($false)))
  Write-Host ("OK {0}: body dashes before={1}, list fixes={2}" -f $f, $dashBefore, $listFixes)
}
Write-Host 'DONE'
