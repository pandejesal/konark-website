$ErrorActionPreference = "Stop"
$env:GITHUB_TOKEN = ""
$prs = gh pr list --repo pandejesal/konark-website --state open --json number,title,headRefName,createdAt,isDraft
$data = $prs | ConvertFrom-Json
foreach ($p in $data) {
    Write-Output ("PR #{0} | {1} | branch: {2} | created: {3} | draft: {4}" -f $p.number, $p.title, $p.headRefName, $p.createdAt, $p.isDraft)
}
