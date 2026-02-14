# Development Context

## Stack
- Astro 5.x static site generator
- Tailwind CSS 4.x (CSS-based config in `src/styles/global.css`)
- Deployed to Cloudflare Pages

## Commands
```bash
npm run dev      # Start dev server at localhost:4321
npm run build    # Production build to dist/
npm run preview  # Preview production build

# Infrastructure
cd terraform && terraform init && terraform apply
```

## Structure
- `src/pages/` - Routes (index, about, contact, case-studies)
- `src/components/` - Astro components
- `src/layouts/Layout.astro` - Base HTML template
- `src/styles/global.css` - Tailwind theme + custom classes
- `public/images/` - Static assets
- `terraform/` - Cloudflare Pages infrastructure

## Brand Colors
- Teal: `#1a9dad` (`brand-teal`)
- Orange: `#f5a623` (`brand-orange`)
- Navy: `#1a1a2e` (`brand-navy`)

## Testing
Use the `playwright-skill` to verify pages visually and check links. If Playwright isn't installed, ask the user to install it (`npx playwright install`).

## Notes
- Contact form uses Formspree (ID needs configuration in `ContactForm.astro`)
- Font: Inter (loaded from Google Fonts)
