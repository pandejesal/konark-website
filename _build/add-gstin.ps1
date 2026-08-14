$ErrorActionPreference = "Stop"

$pages = @(
    "C:\Users\DELL\Desktop\Dad marketing\website\index.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\services.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\case-studies.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\contact.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\about.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\index.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\furnace-safety-audit.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\bms-lifecycle-cost.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\energy-savings-proof.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\relay-to-plc-upgrade.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\tundish-heating.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\dg-set-automation.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\panel-fabrication.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\commissioning-checklist.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\interlock-philosophy.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\articles\self-recuperative-burners.html"
)

$footerOld = '<div class="footer-bottom">&copy; <span data-year>2026</span> Konark Process Instruments. All rights reserved.</div>'
$footerNew = '<div class="footer-bottom">&copy; <span data-year>2026</span> Konark Process Instruments. All rights reserved. GSTIN 24BHTPP8730R1Z8</div>'

# Org-type pages that get taxID in JSON-LD
$taxPages = @(
    "C:\Users\DELL\Desktop\Dad marketing\website\index.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\services.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\contact.html",
    "C:\Users\DELL\Desktop\Dad marketing\website\about.html"
)
$taxOld = '"name": "Konark Process Instruments",'
$taxNew = '"name": "Konark Process Instruments",' + "`n" + '    "taxID": "24BHTPP8730R1Z8",'

$footerCount = 0
$taxCount = 0

foreach ($p in $pages) {
    $content = [System.IO.File]::ReadAllText($p)
    if ($content.Contains($footerOld)) {
        $content = $content.Replace($footerOld, $footerNew)
        $footerCount++
    } else {
        Write-Output ("FOOTER NOT FOUND: " + $p)
    }
    if ($taxPages -contains $p -and $content.Contains($taxOld)) {
        $content = $content.Replace($taxOld, $taxNew)
        $taxCount++
    } elseif ($taxPages -contains $p) {
        Write-Output ("TAX ANCHOR NOT FOUND: " + $p)
    }
    [System.IO.File]::WriteAllText($p, $content)
}

Write-Output ("Footers updated: " + $footerCount + "/16")
Write-Output ("taxID added: " + $taxCount + "/4")
