# Konark Process Instruments — Launch Website

Static, 5-page launch site for a B2B industrial automation lead-generation program.
**No build tools, no frameworks, no npm** — plain HTML5 + CSS3 + vanilla JS. Any agent or
non-technical person can edit it with a text editor.

---

## Project structure

```
konark-website/
├── index.html          Home — hero, trust strip, stats, 5 pillars, why-us, case previews, testimonials
├── services.html       All 5 service pillars with anchors (#bms, #furnace-automation, #plc-scada, #control-panels, #specialized-heating)
├── case-studies.html   5 case studies (challenge → solution → result)
├── about.html          Company story + founder spotlight (Mr. Nilesh Pande)
├── contact.html        Contact details, form (FormSubmit.co), Google Map
├── css/styles.css      Single shared stylesheet (all pages)
├── js/scripts.js       Single shared script (mobile nav, year, form banner)
├── favicon.svg         Burner-mark favicon
├── robots.txt
├── sitemap.xml         Uses placeholder domain — update after buying the domain
├── assets/images/      Expected photo files (see its README.md)
├── README.md           This file
└── DEPLOY.md           Free hosting + domain + email guide
```

---

## How to edit copy (where each text block lives)

| What you want to change | File | Where |
|---|---|---|
| Hero headline (3 options) | `index.html` | Comment block above the `<h1 class="hero-title">` + the h1 itself |
| Hero subheadline | `index.html` | `.hero-sub` paragraph in the hero section |
| Trust strip client names | `index.html` | `.trust-list` in the trust-strip section |
| Stats band numbers | `index.html` | `.stats-grid` block |
| 5 pillar card text | `index.html` | `.cards` section; each `<article class="card">` |
| Why-Konark cards | `index.html` | `.why-grid` section |
| Testimonial quotes | `index.html` | `.testi-note` box (swap for real `.testi-note` content with quotes) |
| Service descriptions | `services.html` | One `<article class="service-block">` per pillar |
| Case studies | `case-studies.html` | One `<article class="cs-article">` per project; edit the `.cs-block` Challenge/Solution/Result boxes |
| Company story / founder | `about.html` | `.story` div — paragraphs are clearly separated |
| Phone / email / hours | All 5 pages | Top bar, `.header-call`, `.footer-contact`, and `contact.html` details. **Change in every page** (5 files). |
| WhatsApp message text | All 5 pages | The `wa.me/918905378147?text=...` links (URL-encoded text after `?text=`) |
| Form fields | `contact.html` | The `<form>` block |
| SEO title/description | Every page | `<title>` and `<meta name="description">` at the top of each file |

**House rules:** keep one `<h1>` per page (already done). Keep alt text on every `<img>`.
No emojis in copy. If you add a photo, use the exact names in `assets/images/README.md`.

---

## How to add real photos

1. Read `assets/images/README.md` for the full list (file names + sizes).
2. Replace each `<div class="img-ph">[REPLACE: ...]</div>` with an `<img>` tag using the matching file.
3. Never publish client-plant photos without permission (see Phase 1 kit, question A4).

Example replacement:
```html
<!-- OLD -->
<div class="img-ph" role="img" aria-label="Placeholder">[REPLACE: photo of a control panel]</div>
<!-- NEW -->
<img src="assets/images/svc-panel.jpg" alt="Konark control panel, front view" loading="lazy" width="800" height="450">
```

---

## Contact form (no backend)

The form posts to **FormSubmit.co** (`https://formsubmit.co/konarkinstruments@gmail.com`):

1. On the **first submission**, FormSubmit sends an activation email to
   `konarkinstruments@gmail.com` — click the confirmation link once. The form works forever after.
2. After deploying, update the hidden `_next` field in `contact.html` to your live absolute URL
   (e.g., `https://konarkprocessinstruments.com/contact.html?sent=1`). Until then, the redirect points at the
   placeholder domain — the email still arrives, but the user is not redirected back.
3. `_captcha=false` is set so buyers are not blocked by a captcha (B2B form, low spam volume).

**Phase 4 note:** to swap this endpoint for an antigravity webhook, change the `<form action="...">`
to your webhook URL and keep the same field names (`name`, `company`, `phone`, `industry`, `message`).
The comment in `contact.html` marks the exact spot.

---

## Verify before shipping (quick checklist)

- [ ] All 5 pages open locally (see DEPLOY.md step 0)
- [ ] Every nav link works; service cards link to `services.html#...` anchors
- [ ] `tel:+918905378147` and `wa.me/918905378147` links open correctly
- [ ] Form sends a test email (activation click required once)
- [ ] Each page has meta title, description, canonical, OG, Twitter tags (already present)
- [ ] Photos added per `assets/images/README.md` (or placeholders left intentionally)
- [ ] Domain purchased → update canonical URLs, sitemap.xml, robots.txt, og:image, `_next`
