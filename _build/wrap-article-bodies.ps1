$ErrorActionPreference = 'Stop'
$files = @('commissioning-checklist','dg-set-automation','interlock-philosophy','panel-fabrication','relay-to-plc-upgrade','self-recuperative-burners','tundish-heating')
$dir = 'C:\Users\DELL\Desktop\Dad marketing\website\articles'
$out = 'C:\Users\DELL\AppData\Local\Temp\opencode\wrapped-articles.txt'
$sb = New-Object System.Text.StringBuilder
foreach ($f in $files) {
  $path = Join-Path $dir ($f + '.html')
  $lines = [System.IO.File]::ReadAllLines($path)
  [void]$sb.AppendLine('### FILE: ' + $f)
  for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    if ($line.Length -le 160) {
      [void]$sb.AppendLine(($i + 1).ToString().PadLeft(4) + ': ' + $line)
    } else {
      $start = 0
      while ($start -lt $line.Length) {
        $len = [Math]::Min(160, $line.Length - $start)
        [void]$sb.AppendLine(($i + 1).ToString().PadLeft(4) + '+ ' + $line.Substring($start, $len))
        $start += 160
      }
    }
  }
}
[System.IO.File]::WriteAllText($out, $sb.ToString())
Write-Output ('Wrapped to ' + $out)
