# DEPLOY.md — Go live for free (then add domain + email)

Three parts: (0) test locally, (1) free hosting — pick **Netlify Drop** (simplest) **or GitHub Pages**,
(2) buy a `.in` domain and point it, (3) free business email with Zoho.

**Time: ~90 minutes total.** No cost unless you buy the domain (~₹800–900/yr) — hosting is free.

---

## 0. Test locally first (10 min)

1. Open the folder `konark-website` in any browser: double-click `index.html`.
   (If the file:// view blocks fonts/map, that is fine — it works once deployed.)
2. Click through all pages: nav, service anchors, call link, WhatsApp link, form.
3. Fix anything you do not like now — easier before it is public.

---

## 1A. Option A — Netlify Drop (recommended, 5 min, no account needed to start)

1. Go to **https://app.netlify.com/drop** in Chrome.
2. Drag the whole `konark-website` **folder** onto the page.
3. You instantly get a live URL like `https://random-name-123.netlify.app`. Open it — site is live.
4. To keep it: click "Connect to Netlify" and create a free account (email or GitHub login).
5. Rename the site: Site settings → Change site name → e.g. `konark-process-instruments`.
6. Every future update = drag the updated folder onto Netlify Drop again (it replaces the site), or
   install the Netlify app/CLI later. Simple wins.

## 1B. Option B — GitHub Pages (choose this if you want Google's "jules" coding agent to edit the site later)

1. Create a free account at **github.com** (use `konarkinstruments@gmail.com`).
2. New repository → name it `konark-website` → **Public**.
3. Upload files: repo page → "uploading an existing file" → drag the contents of `konark-website`
   (index.html, css/, js/, assets/, etc.) — **not** the folder itself, its contents — into the window.
4. Settings → Pages → Source: "Deploy from a branch" → branch `main`, folder `/ (root)` → Save.
5. Your site is live at `https://<username>.github.io/konark-website/` within 1–2 minutes.
6. To point a custom domain at it later: Settings → Pages → Custom domain → `konarkinstruments.in`
   and create a file named `CNAME` (no extension) in the repo root containing `konarkinstruments.in`.
   At your registrar, add four A records: `185.199.108.153`, `185.199.109.153`,
   `185.199.110.153`, `185.199.111.153`.
7. Edit the site any time: change files in the repo (the jules agent can do this for you) — Pages
   rebuilds automatically on every commit.

---

## 2. Buy a domain: konarkinstruments.in (~₹800–900/yr, 20 min)

1. Buy at **GoDaddy India** (godaddy.com/en-in) or **Hostinger India** (hostinger.in). Search
   `konarkinstruments.in` (~₹800–900/yr; `.com` costs more — `.in` is right for India + cheaper).
   Also consider buying `konarkinstruments.com` later as a redirect guard if you can afford it.
2. Whichever host you chose above:
   - **Netlify:** In Netlify → Domain settings → Add custom domain → enter `konarkinstruments.in`
     → follow the DNS instructions (point the domain at Netlify's nameservers, or add the
     `CNAME`/`ALIAS` record Netlify shows you).
   - **GitHub Pages:** add the four A records above + the CNAME file (step 1B.6).
3. DNS can take 15 minutes to 48 hours to spread. Test at `https://konarkinstruments.in` after.
4. **After the domain works, update these placeholders** (search for `konarkinstruments.in` in the files):
   - `index.html`: canonical URL + og:url + JSON-LD `url`
   - `sitemap.xml`: all URLs (already use the domain — verify)
   - `robots.txt`: sitemap URL
   - Every page: `og:image` path (it already uses the domain — works once the file exists)
   - `contact.html`: hidden `_next` field — confirm it is your live domain

---

## 3. Free business email: name@konarkinstruments.in (Zoho, 30 min)

A `@gmail.com` address looks wrong on a defense-grade website; `mr.pande@konarkinstruments.in` looks
right. Zoho Mail's free plan ("Forever Free") gives you up to 5 mailboxes.

1. Go to **zoho.com/mail** → Sign up → Business → **Free plan** → enter `konarkinstruments.in`.
2. Create mailboxes, e.g. `info@`, `mr.pande@`. Start with **info@konarkinstruments.in** as the main one.
3. Zoho shows you **MX records** to add at your registrar (GoDaddy/Hostinger DNS panel):
   - MX: `mx.zoho.in` (priority 10) — for Zoho accounts outside India use `mx.zoho.com`; Zoho will show the exact value
   - TXT/SPF: `v=spf1 include:zoho.in ~all`
   - TXT DKIM: generate in Zoho, paste the long key at your registrar
4. Email works within a few hours of DNS spread. Test by sending from Gmail to info@konarkinstruments.in.
5. Optional: set up forwarding of `konarkinstruments@gmail.com` → info@ so nothing is lost.
6. Update the website's contact email if you switch the public address to info@ — remember: it appears
   on **all 5 pages** (top bar + footer) plus `contact.html`'s FormSubmit action.

---

## 4. Go-live verification checklist (tick all)

- [ ] Site loads on phone AND desktop at your custom domain
- [ ] All 5 pages render; no broken links (nav + service anchors)
- [ ] WhatsApp float button (bottom-right) opens `wa.me` chat with the pre-filled message
- [ ] Call button works on mobile (tap-to-call); phone visible in the sticky header
- [ ] Contact form: send a test — activation email clicked, enquiry received at your mailbox,
      user redirected back to `contact.html?sent=1` with the green thank-you banner
- [ ] Favicon, fonts (Inter/Rajdhani) and map load correctly
- [ ] **Lighthouse (mobile): Performance 90+, SEO 90+, Accessibility 90+**
      How: Chrome → open the site → F12 → Lighthouse tab → "Analyze page load" → mobile device.
      (Or paste the live URL into pagespeed.web.dev.) Fix anything scored below 90.
- [ ] Google Search Console: add the site (search.google.com/search-console) and submit `sitemap.xml`
      so Google starts indexing — with the same Gmail as everything else
- [ ] Canonical URLs, sitemap.xml and robots.txt reflect the real domain
- [ ] Photos swapped in per `assets/images/README.md` (or placeholders intentional)
- [ ] LinkedIn page "Website" field updated to the live domain (Phase 1 kit)
- [ ] Google Business Profile website field updated (Phase 1 kit)

**Done. The site is live and feeding the lead pipeline.** Phase 2 next: LinkedIn content calendar;
Phase 3: outreach using this site as the credibility anchor.
