$ErrorActionPreference = 'Stop'
$src = 'C:\Users\DELL\Desktop\Dad marketing\website'
$dst = 'C:\Users\DELL\Desktop\Dad marketing\konark-website'
$items = @(
  'articles','assets','css','js','_build',
  'about.html','case-studies.html','contact.html',
  'DOMAIN-STEP-SHEET.md','favicon.svg','index.html',
  'llms.txt','robots.txt','services.html','sitemap.xml'
)
foreach ($item in $items) {
  $s = Join-Path $src $item
  $d = Join-Path $dst $item
  if (Test-Path -LiteralPath $s) {
    if (Test-Path -LiteralPath $d) {
      Remove-Item -LiteralPath $d -Recurse -Force
    }
    Copy-Item -LiteralPath $s -Destination $d -Recurse -Force
  }
}
git -C $dst add -A
git -C $dst status --short
