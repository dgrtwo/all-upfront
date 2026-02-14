# Upfront Marketing Site

Static marketing site for Upfront (childcare data platform). Built with Astro 5.x + Tailwind CSS 4.x, deployed to Cloudflare Pages.

## Structure

- `src/pages/` — Routes (file path = URL, e.g. `about.astro` → `/about`)
- `src/components/` — Reusable Astro components (Hero, Header, Footer, CTABanner, etc.)
- `src/layouts/Layout.astro` — Base HTML template
- `src/styles/global.css` — Tailwind theme + custom classes
- `public/images/` — Static assets (logo, partner logos, testimonials, team photos)
- `terraform/` — Cloudflare Pages + GitHub Actions infrastructure

## Design

**Brand colors:** Teal `#1a9dad`, Orange `#f5a623`, Navy `#1a1a2e`

**Buttons:** `.btn-primary` (orange), `.btn-secondary` (teal)

**Font:** Inter (Google Fonts)

## Commands

```bash
npm run dev      # Dev server at localhost:4321
npm run build    # Production build
npm run preview  # Preview build
```

## Notes

- Contact form uses Formspree (configured in `ContactForm.astro`)
- Cloudflare creates preview URLs for every PR automatically

---

## Testing Before Opening a PR

**Required:** Before opening a PR, you MUST:

1. **Build the site** to verify no errors:
   ```bash
   npm run build
   ```

2. **Start the preview server and test with Playwright:**
   ```bash
   # Start preview server in background
   npm run preview &
   sleep 3

   # Take screenshot of the page you modified
   npx playwright screenshot http://localhost:4321/PAGE_PATH screenshot.png

   # Check that the page loads without errors (exit code 0 = success)
   npx playwright screenshot http://localhost:4321/PAGE_PATH /dev/null
   ```

3. **Verify your changes visually** by examining the screenshot. If something looks wrong, fix it before proceeding.

4. **Kill the preview server** when done:
   ```bash
   pkill -f "astro preview" || true
   ```

**Page paths for testing:**
- Homepage: `/`
- About: `/about`
- Contact: `/contact`
- Case Studies: `/case-studies`
- Resources: `/resources`

---

## Scope Constraints (for GitHub Action)

**Only modify:** `src/pages/`, `src/components/`, `src/layouts/`, `src/styles/`, `public/images/`

**Never modify:** `package.json`, config files, `terraform/`, `.github/workflows/`, `CLAUDE.md`

**Rules:**
- If a request is ambiguous, ask a clarifying question rather than guessing
- When creating pages, follow existing conventions

## Merge Rules

Only merge when user explicitly approves ("ship it", "looks good", "approved", "lgtm", "merge this", etc.). Never merge on your own judgment. After merging, confirm and note changes will be live shortly.

## Communication Style

The user is not a developer. Avoid jargon. Write plain-language PR descriptions. Mention that Cloudflare will post a preview link. Ask clarifying questions when unsure.
