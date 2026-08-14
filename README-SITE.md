# Konark Process Instruments — Deploy-Ready Website Package

This folder is the deploy-ready version of the site from the repo
(`pandejesal/konark-website`, branch `main`), plus the additions below.
Upload the CONTENTS of this folder (not the folder itself) to the hosting
root so that `index.html` is at the root.

## What is new in this package (vs. the repo)

| Item | Status | Note |
|------|--------|------|
| `articles/` — 10 technical articles | NEW | furnace-safety-audit, bms-lifecycle-cost, energy-savings-proof (hand-built) + relay-to-plc-upgrade, tundish-heating, dg-set-automation, panel-fabrication, commissioning-checklist, interlock-philosophy, self-recuperative-burners (generated from whale-program authority-content markdown via `_build/convert-articles.ps1`). Each has Article JSON-LD, OG/Twitter tags, author attribution (Nilesh Pande). |
| `llms.txt` | NEW | LLM/AI-citation file (llms.txt standard). Generated from whale-program/ai-visibility draft, paths adjusted to .html pages. |
| `assets/images/og-cover.png` | NEW | 1200x630 brand cover (navy #10171f + orange #e2540f). Generated locally. |
| `sitemap.xml` | UPDATED | Article URLs added; lastmod 2026-08-14. |
| Articles link in nav | UPDATED | Desktop nav, mobile nav and footer quick links on all 5 main pages. |
| `knowsAbout` in JSON-LD | UPDATED | Added to homepage LocalBusiness schema (index.html). |
| JSON-LD on all pages | UPDATED | services.html (ProfessionalService + OfferCatalog), contact.html (LocalBusiness + contactPoint), about.html (Organization + founder), case-studies.html (CollectionPage with the 5 projects), articles/index.html (CollectionPage with all 10 articles). Every page now has valid, parseable structured data. |

## What still needs Mr. Pande / user action

1. **Deploy** (Netlify Drop — no account needed to start, or GitHub Pages / any static host). See repo DEPLOY.md for the original instructions.
2. After deploy, confirm domain: site is built for `https://konarkprocessinstruments.com/`. If the actual URL differs, update: canonical tags (all pages), OG urls (all pages), robots.txt Sitemap line, sitemap.xml locations, llms.txt page links.
3. `foundingDate` in homepage JSON-LD: add once confirmed (approx. 2003 based on 20+ years).
4. Replace placeholder images in `assets/images/` with real photos when available (see assets/images/README.md).

## Build scripts (this folder is generated — rebuild any time)

- `_build/build-site.ps1` — copies the site from the temp repo clone
  (`%TEMP%\opencode\konark-sync`) into this folder, then re-apply the
  deltas below if needed:
  - `_build/convert-articles.ps1` — regenerates article HTML pages from the markdown
  sources in `phase3-content\whale-program\authority-content\article-*.md`
- `_build/gen-og-cover.ps1` — regenerates assets/images/og-cover.png

## Quick deploy steps (Netlify Drop)

1. Go to https://app.netlify.com/drop
2. Drag this folder's contents (index.html at the root) onto the page.
3. Netlify serves it at a random subdomain; then either use that or
   connect the real domain `konarkprocessinstruments.com`.
4. Submit sitemap at https://search.google.com/search-console (once a
   Google account is available).

## LLM discovery

- `llms.txt` at the site root follows the llms.txt standard — AI engines
  will find pages, key facts and contact info.
- Each page has clean HTML + JSON-LD, so AI crawlers (GPTBot, ClaudeBot,
  etc.) can parse it. robots.txt allows all crawlers.