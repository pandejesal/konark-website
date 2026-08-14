# DOMAIN-STEP-SHEET — Buy konarkprocessinstruments.com at Cloudflare, point it at GitHub Pages

**Who does what:** You (human) do steps 1–4 in a browser (~25 min). This sheet is the full
walkthrough. The site is ALREADY live at https://pandejesal.github.io/konark-website/ — nothing
is blocked on this. Do it in parallel with everything else.

**Why this domain:** `konarkprocessinstruments.com` at Cloudflare Registrar, $10.44/yr at cost
(no markup, no upsells). Cloudflare does NOT sell `.in` domains — `.com` was the decision.
GitHub Pages custom domain with Cloudflare DNS = free SSL + CDN.

---

## Part 1 — Buy the domain at Cloudflare (10 min)

1. Open **https://dash.cloudflare.com** in Chrome. Sign up with `konarkinstruments@gmail.com`.
   (One account = registrar + DNS + CDN in the same dashboard. Verify the email they send.)
2. Dashboard → **Domain Registration** (left menu) → **Register Domains**.
3. Search: `konarkprocessinstruments.com`.
   - If it shows **available** → checkout. Price should be exactly **$10.44/yr** (plus, if shown,
     a small ICANN fee ~$0.18 — Cloudflare passes it through at cost; no other charges).
   - If it shows taken → STOP and tell me: we re-evaluate (do NOT buy an alternative on the spot).
4. Payment: credit/debit card works. After payment, the domain appears under
   **Domain Registration → Manage** within minutes.
5. You are done buying. Cloudflare automatically sets its own nameservers for the domain
   (Registrar requires it — no manual nameserver work).

## Part 2 — Verify the domain in GitHub Pages (10 min)

1. Open **https://github.com/pandejesal/konark-website** → **Settings** → **Pages** (left menu).
2. Under **Custom domain**, type `konarkprocessinstruments.com` → **Save**.
3. GitHub immediately shows a **TXT verification record**, like:
   `_github-pages-challenge-pandejesal` → value `e8a4f...` (long random string).
   Copy BOTH the hostname and the value — you need them in the next part.
4. Keep that GitHub tab open; the page will re-check automatically.

## Part 3 — Add DNS records at Cloudflare (5 min)

1. Back in **dash.cloudflare.com** → your domain `konarkprocessinstruments.com` → **DNS → Records**.
2. Add these records (button: **Add record**):

   | Type | Name | Content | Proxy (orange cloud) |
   |---|---|---|---|
   | TXT | `_github-pages-challenge-pandejesal` | (the value GitHub showed you) | off (grey cloud, TXT has no proxy) |
   | CNAME | `@` | `pandejesal.github.io` | on (orange cloud) |

   Notes:
   - `@` = the bare domain (Cloudflare shows it as `@` or the domain itself).
   - Cloudflare **flattens** CNAME at the apex (root domain) — this works with GitHub Pages even
     though the old-style instructions say "A records". If CNAME `@` is rejected, add the four
     A records instead: `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`.
   - Keep the orange cloud ON for the CNAME — that gives free SSL and CDN through Cloudflare.
3. Wait 1–2 minutes, then go back to the GitHub Pages tab. It should flip from
   "Verification pending" to **"Your site is published at https://konarkprocessinstruments.com"**.
   If it stays pending more than 10 minutes, re-check the TXT value was copied exactly.

## Part 4 — Verify live + turn on HTTPS (5 min)

1. In the GitHub Pages settings, tick **Enforce HTTPS** (available shortly after verification).
2. Open **https://konarkprocessinstruments.com** on phone and desktop:
   - Home page loads with the orange accent + KONARK PROCESS INSTRUMENTS branding.
   - Click through: Services, Case Studies, About, Articles, Contact. WhatsApp float button works.
   - The URL bar shows the lock (SSL via Cloudflare).
3. Also test the github.io URL still works: https://pandejesal.github.io/konark-website/ — both
   should now serve the same site (canonicals all point at the `.com`).

## Part 5 — After the domain is live (do in order)

1. **Tell me the domain is live.** I will then:
   - Update `contact.html` `_next` field to the real domain (currently github.io until then).
   - Update any remaining github.io references in kit docs.
   - Start the KPI clock (month 1 = first full month after domain live; first review Sep 30).
2. **Google Search Console** (10 min, you): search.google.com/search-console → add property
   `konarkprocessinstruments.com` (Domain or URL-prefix) with `konarkinstruments@gmail.com` →
   verify via the TXT or HTML tag Cloudflare shows → submit `https://konarkprocessinstruments.com/sitemap.xml`.
3. **Business email (optional, 30 min):** Zoho Mail free plan → enter the domain → add the MX/SPF
   records Zoho shows in Cloudflare DNS → test info@konarkprocessinstruments.com.
   (Until then, public email stays konarkinstruments@gmail.com — fine for launch.)

---

## Costs recap

| Item | Cost | Where |
|---|---|---|
| Domain | $10.44/yr (≈ ₹875) | Cloudflare Registrar |
| Hosting | $0 | GitHub Pages |
| SSL | $0 | Cloudflare + GitHub |
| Email (optional) | $0 (Zoho free) | Zoho |
| Total launch cost | **$10.44/yr** | |

## Troubleshooting

- **"Custom domain is not correctly configured"** in GitHub → usually the TXT verification record
  missing or mistyped. Re-copy the value GitHub showed (Part 2.3).
- **Site loads on github.io but not the .com** → DNS not spread or CNAME pointing at wrong target.
  Wait 15 min; check the CNAME row says `pandejesal.github.io` with orange cloud ON.
- **Cloudflare "Error 1000/1001"** → wrong DNS target. CNAME must be exactly `pandejesal.github.io`.
- **Payment declined** → try a different card; Cloudflare does not take UPI — card/PayPal only.
