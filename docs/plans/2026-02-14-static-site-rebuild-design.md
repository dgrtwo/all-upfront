# Upfront Static Site Rebuild - Design Document

## Overview

Rebuild allupfront.com as a static website, migrating from Framer to a modern static site stack. Same core content with a visual refresh using current design trends.

## Tech Stack

| Component | Choice | Rationale |
|-----------|--------|-----------|
| Framework | Astro 4.x | Purpose-built for content sites, minimal JS output, excellent DX |
| Styling | Tailwind CSS 3.x | Industry standard, fast development, easy maintenance |
| Hosting | Cloudflare Pages | Free, fastest global CDN, automatic GitHub deploys |
| Contact Form | Formspree | Simple, free tier (50/month), no backend needed |

## Project Structure

```
all-upfront/
├── src/
│   ├── layouts/
│   │   └── Layout.astro        # Base HTML, meta tags, fonts
│   ├── components/
│   │   ├── Header.astro        # Nav with logo, links, CTA
│   │   ├── Footer.astro        # Footer links, copyright
│   │   ├── Hero.astro          # Homepage hero section
│   │   ├── ModuleCard.astro    # Feature/module cards
│   │   ├── Testimonial.astro   # Quote cards
│   │   └── ContactForm.astro   # Formspree form
│   └── pages/
│       ├── index.astro         # Homepage
│       ├── about.astro         # About page
│       ├── contact.astro       # Contact page
│       └── case-studies.astro  # Combined case studies
├── public/
│   └── images/                 # Logo, photos, partner logos
├── astro.config.mjs
├── tailwind.config.mjs
└── package.json
```

## Visual Design System

### Color Palette

- **Primary Teal:** `#1a9dad` - CTAs, links, accents
- **Secondary Orange:** `#f5a623` - Highlights, hover states
- **Dark Navy:** `#1a1a2e` - Headings, nav text
- **Light backgrounds:** `#f8fafa` (off-white), `#ffffff`
- **Text gray:** `#4a5568` - Body copy

### Typography

- **Headings:** Inter (bold/semibold)
- **Body:** Inter (regular)
- Loaded via Google Fonts with `font-display: swap`

### Modern Refresh Elements

- Subtle gradient overlays on hero section
- Soft shadows on cards (no hard edges)
- Micro-interactions: button hover lifts, smooth link underlines
- Geometric accent shapes as inline SVGs
- Generous white space, larger click targets
- Smooth scroll behavior

### Responsive Breakpoints

- Mobile: < 768px (single column, hamburger nav)
- Tablet: 768px - 1024px (2 columns)
- Desktop: > 1024px (full layout)

## Page Layouts

### Homepage

1. **Hero** - Main headline + subtext + "Talk to Us" CTA + geometric shapes
2. **Partner logos** - "Our Innovative ECE Partners" with 4 logos
3. **Value prop** - "A single database for a single source of truth" + integration list
4. **Modules grid** - 8 feature cards (Family Search, Applications, Call Referral, Professional Development, Technical Assistance, Provider Portal, Childcare Desert Maps, Employer Engagement)
5. **Testimonials** - 2 quote cards (Laura Weeldreyer, Kayla Corbitt)
6. **Audience sections** - Two cards: CCR&Rs + Government Organizations
7. **CTA banner** - "Let's Talk ECE Data!" + Contact button
8. **Footer**

### About Page

1. Hero - "A personal mission to make childcare accessible to all"
2. Our Vision section
3. Our Team section
4. CEO spotlight (Dana Levin-Robinson) with photo
5. Partner logos bar
6. CTA banner
7. Footer

### Contact Page

1. Hero - "Let's Talk!"
2. Formspree form (Name, Email, Company, Message)
3. Footer

### Case Studies Page

1. Hero - "Our Impact"
2. Maryland Family Network summary
3. North Carolina summary
4. Denver Preschool Program summary
5. CTA banner
6. Footer

## Assets to Migrate

Download from current Framer site:

- [ ] Upfront logo
- [ ] Partner logos (4):
  - Child Care Resources Inc.
  - Maryland Family Network
  - Child & Family Resources
  - Denver Preschool Program
- [ ] Testimonial headshots:
  - Laura Weeldreyer
  - Kayla Corbitt
- [ ] CEO photo (Dana Levin-Robinson)

Recreate as inline SVGs:

- [ ] Geometric accent shapes (hero decoration)

## Implementation Details

### Formspree Setup

- Create account at formspree.io
- Free tier: 50 submissions/month
- Configure email notifications
- Form fields: Name, Email, Company, Message

### SEO & Performance

- Meta tags (title, description, Open Graph)
- Sitemap generation (Astro built-in)
- Image optimization (Astro image handling)
- Target: Lighthouse 95+ all metrics

### Deployment Flow

1. Push to GitHub `main` branch
2. Cloudflare Pages auto-builds
3. DNS configured to point allupfront.com to Cloudflare Pages

### Local Development

```bash
npm run dev    # Astro dev server at localhost:4321
```

Playwright for verification:
- Screenshots at mobile/tablet/desktop breakpoints
- Link verification
- Form testing
- Visual comparison

## Content Reference

All content migrated from current site at https://www.allupfront.com/

Key copy:
- Headline: "Accurate, standardized, accessible childcare data for all."
- Subhead: "An integrated software for government agencies, Child Care Resource & Referral, and Early Childhood Education organizations."
- Value prop: "A single database for a single source of truth."
