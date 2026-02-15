# Upfront Marketing Site

Astro 5.x + Tailwind CSS 4.x site deployed to Cloudflare Pages.

## Structure

- `src/pages/` — Routes (`about.astro` → `/about`)
- `src/components/` — Reusable components (Hero, Header, Footer, etc.)
- `src/layouts/Layout.astro` — Base template
- `src/styles/global.css` — Tailwind theme
- `public/images/` — Static assets

## Brand

Colors: Teal `#1a9dad`, Orange `#f5a623`, Navy `#1a1a2e`

Buttons: `.btn-primary` (orange), `.btn-secondary` (teal)

## Commands

```bash
npm run build    # Build (run before PR)
npm run preview  # Preview server at :4321
```

## GitHub Action Rules

**Allowed:** `src/`, `public/images/`

**Forbidden:** `package.json`, config files, `terraform/`, `.github/`, `CLAUDE.md`

## Workflow

1. Make the change
2. Run `npm run build` to verify
3. For layout/style changes: test with Playwright `npx playwright screenshot http://localhost:4321/PAGE screenshot.png`
   (Skip for simple copy changes like fixing typos or updating text)
4. Create branch and PR linking to issue
5. Wait for user approval before merging (`gh pr merge --squash`)

## Style

- Plain language, no jargon
- Ask clarifying questions if unclear
- Mention Cloudflare will post preview link
