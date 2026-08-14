# GENERATE OG COVER - 1200x630 brand image for social/OG sharing
# ASCII-only (PowerShell 5.1). Uses System.Drawing.
Add-Type -AssemblyName System.Drawing

$out = "C:\Users\DELL\Desktop\Dad marketing\website\assets\images\og-cover.png"
$w = 1200; $h = 630
$bmp = New-Object System.Drawing.Bitmap($w, $h)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
$g.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

# background: ink-900 #10171f
$g.Clear([System.Drawing.ColorTranslator]::FromHtml("#10171f"))

# accent bar left: orange #e2540f
$bar = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml("#e2540f"))
$g.FillRectangle($bar, 60, 120, 8, 390)

# heading font (bold sans)
$fontHead = New-Object System.Drawing.Font("Arial", 76, [System.Drawing.FontStyle]::Bold)
$brushWhite = New-Object System.Drawing.SolidBrush ([System.Drawing.Color]::White)
$g.DrawString("KONARK", $fontHead, $brushWhite, 100, 130)

# sub line
$fontSub = New-Object System.Drawing.Font("Arial", 30, [System.Drawing.FontStyle]::Regular)
$brushOrange = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml("#e2540f"))
$g.DrawString("PROCESS INSTRUMENTS", $fontSub, $brushOrange, 104, 240)

# tagline
$fontTag = New-Object System.Drawing.Font("Arial", 22, [System.Drawing.FontStyle]::Regular)
$brushGrey = New-Object System.Drawing.SolidBrush ([System.Drawing.ColorTranslator]::FromHtml("#b6bec7"))
$g.DrawString("Burner Management Systems  |  Furnace Automation  |  PLC & SCADA", $fontTag, $brushGrey, 104, 320)
$g.DrawString("Control Panels  |  Commissioning  |  Ahmedabad, India", $fontTag, $brushGrey, 104, 360)

# footer
$fontFoot = New-Object System.Drawing.Font("Arial", 18, [System.Drawing.FontStyle]::Regular)
$g.DrawString("konarkprocessinstruments.com", $fontFoot, $brushGrey, 104, 540)

$bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)

$g.Dispose(); $bmp.Dispose(); $bar.Dispose(); $brushWhite.Dispose(); $brushOrange.Dispose(); $brushGrey.Dispose()
$fontHead.Dispose(); $fontSub.Dispose(); $fontTag.Dispose(); $fontFoot.Dispose()

Write-Output ("Wrote " + $out + " (" + (Get-Item $out).Length + " bytes)")