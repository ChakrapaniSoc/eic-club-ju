# EMBEDEX Innovators Club website

Responsive club website, admin content manager and event registration flow for Vercel.

## Stack
- Static HTML/CSS/JS frontend
- Vercel serverless API (Node.js)
- Supabase Postgres + Storage

## Supabase setup
1. Create a Supabase project.
2. Run `supabase/schema.sql` in the Supabase SQL Editor.
3. Copy the project URL and service-role key from Project Settings → API. Keep the service-role key server-side only.

## Vercel environment variables
Set for Production, Preview and Development:
- `SUPABASE_URL` — Supabase project URL
- `SUPABASE_SERVICE_ROLE_KEY` — Supabase service-role key (server only)
- `ADMIN_USERNAME` — `admin`
- `ADMIN_PASSWORD` — `admin@eic2025` (change before public launch)
- `ADMIN_JWT_SECRET` — long random secret, 32+ characters
- `SITE_ORIGIN` — deployed origin, e.g. `https://your-project.vercel.app`
- `SUPABASE_STORAGE_BUCKET` — `eic-media` (optional)

The starter admin credentials are environment variables, not hard-coded in browser JavaScript. Change the password before sharing the site publicly.

## Deploy
Import `ChakrapaniSoc/eic-club-ju` into Vercel, add the environment variables, then deploy. No build command is required; use the repository root as output. Redeploy after changing environment variables.

## Admin and registration
- Admin dashboard: `/admin.html` (also linked by the bottom-right button on the homepage).
- Admin can create, edit and delete events, members and achievements; upload images up to 5 MB; and view registration submissions.
- Student registration: `/registration.html`; collects name, roll/PRN number, mobile, email and supports multiple event selections.

## Security and final content
The API uses the Supabase service-role key only on the server. Tables have RLS enabled without public direct-access policies. Public reads and registrations pass through the Vercel API. This starter does not send email/WhatsApp confirmations. Add official logos, event posters, member photos, club email and social links before launch.