-- Command Mission Control :: optional seed data
-- Run once after docs/supabase-setup.sql to populate the dashboard
-- with the original placeholder rows across three categories.
-- Safe to run multiple times: the WHERE NOT EXISTS clause prevents duplicates
-- based on (category_name, title).

INSERT INTO link_dashboard.links (category_name, title, url, description)
SELECT v.category_name, v.title, v.url, v.description
FROM (VALUES
    ('Analytics',          'Plausible',   'https://plausible.io', 'Website analytics'),
    ('Analytics',          'Sentry',      'https://sentry.io',    'Error monitoring'),
    ('Hosting',            'Vercel',      'https://vercel.com',   'Frontend deployments'),
    ('Hosting',            'Railway',     'https://railway.app',  'Backend services'),
    ('Hosting',            'Cloudflare',  'https://cloudflare.com','DNS and CDN'),
    ('Hosting',            'DigitalOcean','https://digitalocean.com','Cloud infrastructure'),
    ('Project Management', 'Notion',      'https://notion.so',    'Docs and wikis'),
    ('Project Management', 'Linear',      'https://linear.app',   'Issue tracking')
) AS v(category_name, title, url, description)
WHERE NOT EXISTS (
    SELECT 1
    FROM link_dashboard.links l
    WHERE l.category_name = v.category_name
      AND l.title = v.title
);
