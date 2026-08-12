# assets/images/ — expected image files

This folder currently contains **no real photos by design** — the site uses CSS placeholder boxes so it works
instantly and never shows stock photos. Replace them with real photos from the Phase 1 kit
(`phase1-kit/materials/materials-inventory.md` and `photo-shoot-guide.md`).

**HOW TO ADD A PHOTO (3 steps):**
1. Copy the photo into this folder with the exact file name below (e.g., `about-nilesh.jpg`).
2. Open the page HTML and replace the placeholder `<div class="img-ph">[REPLACE: ...]</div>` with:
   `<img src="assets/images/about-nilesh.jpg" alt="Mr. Nilesh Pande at work" loading="lazy" width="800" height="1000">`
3. Re-upload to Netlify Drop / GitHub Pages (see DEPLOY.md) — same drag-and-drop, files overwrite.

**File naming rules:** lowercase, no spaces, `.jpg` (or `.png`). Keep the file names below so
sitemaps and future edits stay predictable.

---

## Expected files and recommended sizes

| File name | Size (px) | Where it is used | Photo suggestion |
|---|---|---|---|
| `og-cover.png` | 1200 × 630 | Meta og:image on every page (social share card) | Workshop or panel shot with "Konark Process Instruments" text — make in Canva |
| `cs-navy.jpg` | 800 × 450 | case-studies.html #navy | Navy DG-set automation — **client approval required** |
| `cs-bharat-forge.jpg` | 800 × 450 | case-studies.html #bharat-forge | Heat-treatment furnace line — **permission required** |
| `cs-vesuvius.jpg` | 800 × 450 | case-studies.html #vesuvius | Tundish heating system — **permission required** |
| `cs-jindal.jpg` | 800 × 450 | case-studies.html #jindal-saw | Recuperative burner system — **permission required** |
| `cs-kenya.jpg` | 800 × 450 | case-studies.html #kenya | Kenya commissioning — **permission required** |
| `about-nilesh.jpg` | 800 × 1000 | about.html founder photo (portrait) | Mr. Pande at work — photo-shoot shot 6 |
| `svc-bms.jpg` | 800 × 450 | services.html #bms | Burner train / BMS panel |
| `svc-furnace.jpg` | 800 × 450 | services.html #furnace-automation | Furnace control station |
| `svc-plc.jpg` | 800 × 450 | services.html #plc-scada | Siemens/Rockwell PLC rack or SCADA screen |
| `svc-panel.jpg` | 800 × 450 | services.html #control-panels | Finished Konark panel, front view |
| `svc-heating.jpg` | 800 × 450 | services.html #specialized-heating | Tundish heater or recuperative burner |
| `home-case-navy.jpg` | 800 × 450 | index.html case preview 1 | Same as cs-navy.jpg (reuse the file) |
| `home-case-forge.jpg` | 800 × 450 | index.html case preview 2 | Same as cs-bharat-forge.jpg |
| `home-case-kenya.jpg` | 800 × 450 | index.html case preview 3 | Same as cs-kenya.jpg |

**Sizing tip:** 800 × 450 at ~80% JPEG quality keeps pages fast. Do not upload 12-megapixel
originals — resize first (Windows: right-click → Resize pictures; free tool: imagecompressor.com).
Total image budget for the whole site: under 500 KB.

**Important:** photos of client plants (Navy, Bharat Forge, Vesuvius, Jindal Saw, Kenya) may only be
published with the client's permission — see `phase1-kit/owner-manual-checklist.md`, question A4.
Until then, leave the placeholders; the site looks intentional, not broken.
