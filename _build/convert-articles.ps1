# CONVERT ARTICLES - generate article HTML pages from markdown sources
# ASCII-only (PowerShell 5.1)
$ErrorActionPreference = "Stop"

$srcDir = "C:\Users\DELL\Desktop\Dad marketing\phase3-content\whale-program\authority-content"
$outDir = "C:\Users\DELL\Desktop\Dad marketing\website\articles"
$wa = "https://wa.me/918905378147"
$mail = "konarkinstruments@gmail.com"

$map = @(
  @{ slug = "relay-to-plc-upgrade"; title = "When should a furnace owner upgrade from relay logic to a PLC-based BMS?"; desc = "Five signals that tell a furnace owner when hardwired relay logic has aged out - and what a migration to a PLC-based burner management system must preserve." },
  @{ slug = "tundish-heating"; title = "Tundish heating: why the temperature of an empty vessel decides steel quality"; desc = "Why a cold or unevenly heated tundish shows up as first-cast defects - and what automatic tundish heating (Dumac burner technology) should do about it." },
  @{ slug = "dg-set-automation"; title = "DG-set automation: what your factory does in the ten seconds of a power failure"; desc = "The hidden costs of manual DG changeover - and how AMF panels turn a chaotic restart into a proven sequence of start, prove, changeover and load re-energising." },
  @{ slug = "panel-fabrication"; title = "Control panel fabrication: the twelve things a buyer should inspect before dispatch"; desc = "From busbar sizing and earthing discipline to numbered terminals and the as-built drawing set - the invisible quality that decides a panel's working life." },
  @{ slug = "commissioning-checklist"; title = "The commissioning checklist: how to tell a real furnace automation handover from a ceremony"; desc = "Twelve checks that separate a real handover from a ceremony - and the three questions that expose a demo instead of a proof." },
  @{ slug = "interlock-philosophy"; title = "Interlock philosophy: why safety interlocks exist, and why they get bypassed"; desc = "Why interlocks get bypassed, why bypasses are dangerous even when nothing happens - and how to design systems that trip on real faults, not noise." },
  @{ slug = "self-recuperative-burners"; title = "Self-recuperative burners explained: how waste heat becomes fuel savings"; desc = "How self-recuperative burners preheat combustion air with exhaust heat, the honest limitations, and how to buy the project with measurement, not percentages." }
)

function Format-Inline([string]$s) {
    $s = $s -replace '&', '&amp;'
    $s = [regex]::Replace($s, '\*\*(.+?)\*\*', '<strong>$1</strong>')
    return $s
}

$script:sb = $null
$script:para = $null
$script:listType = ""

function Flush-Para {
    if ($script:para.Count -gt 0) {
        $text = $script:para -join " "
        [void]$script:sb.Append("<p>" + $text + "</p>")
        $script:para.Clear()
    }
}
function Close-List {
    if ($script:listType -ne "") {
        [void]$script:sb.Append("</" + $script:listType + ">")
        $script:listType = ""
    }
}
function Open-List([string]$t) {
    if ($script:listType -ne $t) {
        Close-List
        [void]$script:sb.Append("<" + $t + ">")
        $script:listType = $t
    }
}

function Convert-ArticleBody([string]$md) {
    $sb = New-Object System.Text.StringBuilder
    $para = New-Object System.Collections.ArrayList
    $script:sb = $sb
    $script:para = $para
    $script:listType = ""
    $title = ""
    $lines = $md -split "`r?`n"
    foreach ($raw in $lines) {
        $line = $raw.TrimEnd()
        if ($line -eq "") { Flush-Para; continue }
        if ($line -match '^Technical article') { continue }
        if ($line -match '^# ') { $title = ($line -replace '^# ', '').Trim(); continue }
        if ($line -match '^## ') {
            Flush-Para; Close-List
            $h = ($line -replace '^## ', '').Trim()
            $h = Format-Inline $h
            [void]$sb.Append("<h2>" + $h + "</h2>")
            continue
        }
        if ($line -match '^> ') {
            Flush-Para; Close-List
            $q = Format-Inline (($line -replace '^> ', '').Trim())
            [void]$sb.Append("<blockquote><p>" + $q + "</p></blockquote>")
            continue
        }
        if ($line -match '^1\.\s') {
            Flush-Para
            Open-List "ol"
            [void]$sb.Append("<li>" + (Format-Inline (($line -replace '^1\.\s', '').Trim())) + "</li>")
            continue
        }
        if ($line -match '^-\s') {
            Flush-Para
            Open-List "ul"
            [void]$sb.Append("<li>" + (Format-Inline (($line -replace '^-\s', '').Trim())) + "</li>")
            continue
        }
        if ($line -match '^Contact:') {
            Flush-Para; Close-List
            [void]$sb.Append('<p class="article-contact">Contact: <a href="' + $wa + '">WhatsApp +91 89053 78147</a> | <a href="mailto:' + $mail + '">' + $mail + '</a></p>')
            continue
        }
        if ($line -match '^"') {
            Flush-Para; Close-List
            [void]$sb.Append("<blockquote><p>" + (Format-Inline $line) + "</p></blockquote>")
            continue
        }
        Close-List
        [void]$para.Add((Format-Inline $line))
    }
    Flush-Para; Close-List
    return @{ title = $title; body = $sb.ToString() }
}

function Build-Page($title, $desc, $slug, $body, $h1) {
    $url = "https://konarkprocessinstruments.com/articles/" + $slug + ".html"
    $tpl = @'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>__TITLE__ | Konark Process Instruments</title>
  <meta name="description" content="__DESC__">
  <link rel="canonical" href="__URL__">

  <meta property="og:type" content="article">
  <meta property="og:site_name" content="Konark Process Instruments">
  <meta property="og:title" content="__TITLE__">
  <meta property="og:description" content="__DESC__">
  <meta property="og:url" content="__URL__">
  <meta property="og:image" content="https://konarkprocessinstruments.com/assets/images/og-cover.png">

  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="__TITLE__">
  <meta name="twitter:description" content="__DESC__">
  <meta name="twitter:image" content="https://konarkprocessinstruments.com/assets/images/og-cover.png">

  <link rel="icon" type="image/svg+xml" href="../favicon.svg">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Rajdhani:wght@500;600;700&family=Source+Serif+4:opsz,wght@8..60,400;8..60,600;8..60,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="../css/styles.css">

  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "__H1__",
    "description": "__DESC__",
    "author": { "@type": "Person", "name": "Nilesh Pande", "jobTitle": "Founder and Lead Engineer" },
    "publisher": { "@type": "Organization", "name": "Konark Process Instruments" },
    "url": "__URL__",
    "inLanguage": "en"
  }
  </script>
</head>
<body>

  <div class="topbar">
    <div class="topbar-inner">
      <a class="topbar-link" href="tel:+918905378147">+91 89053 78147</a>
      <a class="topbar-link" href="mailto:konarkinstruments@gmail.com">konarkinstruments@gmail.com</a>
      <span class="topbar-hint">Mon&ndash;Sat 9:30&ndash;18:30 IST</span>
    </div>
  </div>

  <header class="header">
    <div class="header-inner">
      <a class="logo" href="../index.html" aria-label="Konark Process Instruments - home">
        <img class="logo-mark" src="../favicon.svg" alt="Konark Process Instruments logo" width="42" height="42">
        <span class="logo-text">
          <strong>KONARK</strong>
          <span>Process Instruments</span>
        </span>
      </a>
      <nav class="nav" aria-label="Main navigation">
        <ul class="nav-list">
          <li><a class="nav-link" href="../index.html">Home</a></li>
          <li><a class="nav-link" href="../services.html">Services</a></li>
          <li><a class="nav-link" href="../case-studies.html">Case Studies</a></li>
          <li><a class="nav-link" href="../about.html">About</a></li>
          <li><a class="nav-link" href="../articles/index.html">Articles</a></li>
          <li><a class="nav-link" href="../contact.html">Contact</a></li>
        </ul>
      </nav>
      <a class="header-call" href="tel:+918905378147">Call Now</a>
      <button class="hamburger" aria-label="Open menu" aria-expanded="false">
        <span></span><span></span><span></span>
      </button>
    </div>
    <nav class="nav-mobile" aria-label="Mobile navigation">
      <a href="../index.html">Home</a>
      <a href="../services.html">Services</a>
      <a href="../case-studies.html">Case Studies</a>
      <a href="../about.html">About</a>
      <a href="../articles/index.html">Articles</a>
      <a href="../contact.html">Contact</a>
    </nav>
  </header>

  <main>
    <section class="page-hero">
      <div class="container">
        <span class="eyebrow">Technical article</span>
        <h1>__H1__</h1>
        <p class="section-sub">By Nilesh Pande, Founder and Lead Engineer, Konark Process Instruments</p>
      </div>
    </section>

    <section class="section">
      <div class="container article-body">
__BODY__
      </div>
    </section>

    <section class="cta-band">
      <div class="cta-inner">
        <div>
          <h2 class="cta-title">Need this engineering, done properly?</h2>
          <p class="cta-sub">Talk to an engineer - call, email or WhatsApp us.</p>
        </div>
        <div class="cta-actions">
          <a class="btn btn-navy" href="tel:+918905378147">Call Now</a>
          <a class="btn btn-navy" href="__WA__">WhatsApp Us</a>
          <a class="btn btn-outline-light" href="../contact.html">Send an Enquiry</a>
        </div>
      </div>
    </section>
  </main>

  <footer class="footer">
    <div class="footer-grid">
      <div class="footer-col">
        <h3 class="footer-title">Konark Process Instruments</h3>
        <p>Industrial automation and control engineering from Ahmedabad, India - 20+ years of Burner Management Systems, furnace automation, PLC &amp; SCADA and control panels. We serve clients in India and worldwide.</p>
      </div>
      <div class="footer-col">
        <h3 class="footer-title">Quick links</h3>
        <ul>
          <li><a href="../index.html">Home</a></li>
          <li><a href="../services.html">Services</a></li>
          <li><a href="../case-studies.html">Case Studies</a></li>
          <li><a href="../about.html">About Us</a></li>
          <li><a href="../articles/index.html">Articles</a></li>
          <li><a href="../contact.html">Contact</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h3 class="footer-title">Contact</h3>
        <ul class="footer-contact">
          <li><span>22, Mahavir Industrial Park, Behind Shankheswar Industrial Park 2, Near Gujarat Offset, Vatva, Ahmedabad &ndash; 382845, Gujarat, India</span></li>
          <li><a href="tel:+918905378147">+91 89053 78147</a></li>
          <li><a href="mailto:konarkinstruments@gmail.com">konarkinstruments@gmail.com</a></li>
          <li><span>Mon&ndash;Sat, 9:30&ndash;18:30 IST</span></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">&copy; <span data-year>2026</span> Konark Process Instruments. All rights reserved.</div>
  </footer>

  <a class="wa-float" href="__WA__" aria-label="Chat with us on WhatsApp" title="Chat with us on WhatsApp">
    <svg width="30" height="30" viewBox="0 0 24 24" fill="#ffffff" aria-hidden="true"><path d="M12.04 2C6.58 2 2.13 6.45 2.13 11.91c0 1.75.46 3.45 1.32 4.95L2.05 22l5.25-1.38a9.9 9.9 0 0 0 4.74 1.21c5.46 0 9.91-4.45 9.91-9.91 0-2.65-1.03-5.14-2.9-7.01A9.82 9.82 0 0 0 12.04 2zm0 18.15a8.2 8.2 0 0 1-4.19-1.15l-.3-.18-3.12.82.83-3.04-.2-.31a8.26 8.26 0 0 1-1.26-4.38c0-4.54 3.7-8.24 8.24-8.24 2.2 0 4.27.86 5.82 2.42a8.18 8.18 0 0 1 2.41 5.83c0 4.54-3.7 8.23-8.23 8.23zm4.52-6.16c-.25-.12-1.47-.72-1.69-.81-.23-.08-.39-.12-.56.13-.17.25-.64.81-.78.97-.14.17-.29.19-.54.06-.25-.12-1.05-.39-1.99-1.23-.74-.66-1.23-1.47-1.38-1.72-.14-.25-.02-.38.11-.51.11-.11.25-.29.37-.43.12-.14.17-.25.25-.41.08-.17.04-.31-.02-.43-.06-.12-.56-1.34-.76-1.84-.2-.48-.41-.42-.56-.43h-.48c-.17 0-.43.06-.66.31-.22.25-.86.85-.86 2.07 0 1.22.89 2.4 1.01 2.56.12.17 1.75 2.67 4.23 3.74.59.26 1.05.41 1.41.52.59.19 1.13.16 1.56.1.48-.07 1.47-.6 1.67-1.18.21-.58.21-1.07.14-1.18-.06-.1-.22-.16-.47-.28z"/></svg>
  </a>
  <a class="call-float" href="tel:+918905378147" aria-label="Call Konark Process Instruments" title="Call us now">
    <svg width="26" height="26" viewBox="0 0 24 24" fill="#ffffff" aria-hidden="true"><path d="M6.62 10.79a15.05 15.05 0 0 0 6.59 6.59l2.2-2.2a1 1 0 0 1 1.02-.24c1.12.37 2.33.57 3.57.57a1 1 0 0 1 1 1V20a1 1 0 0 1-1 1C10.61 21 3 13.39 3 4a1 1 0 0 1 1-1h3.5a1 1 0 0 1 1 1c0 1.24.2 2.45.57 3.57a1 1 0 0 1-.24 1.02l-2.21 2.2z"/></svg>
  </a>

  <script src="../js/scripts.js"></script>
</body>
</html>
'@
    $page = $tpl
    $page = $page -replace '__TITLE__', $title
    $page = $page -replace '__DESC__', $desc
    $page = $page -replace '__URL__', $url
    $page = $page -replace '__H1__', $h1
    $page = $page -replace '__BODY__', $body
    $page = $page -replace '__WA__', $wa
    return $page
}

foreach ($m in $map) {
    $mdPath = Join-Path $srcDir ("article-" + $m.slug + ".md")
    if (-not (Test-Path $mdPath)) { Write-Output ("SKIP (no source): " + $m.slug); continue }
    $md = Get-Content $mdPath -Raw
    $conv = Convert-ArticleBody $md
    $h1 = $conv.title
    $page = Build-Page $m.title $m.desc $m.slug $conv.body $h1
    $outPath = Join-Path $outDir ($m.slug + ".html")
    [System.IO.File]::WriteAllText($outPath, $page, (New-Object System.Text.UTF8Encoding($false)))
    Write-Output ("Wrote " + $m.slug + ".html (h1: " + $h1 + ")")
}