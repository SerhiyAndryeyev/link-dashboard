-- Command Mission Control :: Supabase setup
-- Run in the Supabase SQL editor for any fresh environment.
-- Also make sure `link_dashboard` is added under
-- Project Settings -> API -> Data API -> Exposed schemas.

-- 1. Schema + table
CREATE SCHEMA IF NOT EXISTS link_dashboard;

CREATE TABLE IF NOT EXISTS link_dashboard.links (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id       UUID NOT NULL DEFAULT '00000000-0000-0000-0000-000000000000',
    category_name TEXT NOT NULL,
    title         TEXT NOT NULL,
    url           TEXT NOT NULL,
    description   TEXT,
    favicon_url   TEXT,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS links_category_created_idx
    ON link_dashboard.links (category_name, created_at DESC);

-- 2. Role access to the schema
GRANT USAGE ON SCHEMA link_dashboard TO anon, authenticated, service_role;

-- 3. Table access
GRANT SELECT, INSERT, UPDATE, DELETE ON link_dashboard.links
    TO anon, authenticated, service_role;

-- 4. Future tables in this schema inherit the same grants
ALTER DEFAULT PRIVILEGES IN SCHEMA link_dashboard
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO anon, authenticated, service_role;

-- 5. Row Level Security (permissive for single-user MVP)
ALTER TABLE link_dashboard.links ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "public read"   ON link_dashboard.links;
DROP POLICY IF EXISTS "public insert" ON link_dashboard.links;
DROP POLICY IF EXISTS "public update" ON link_dashboard.links;
DROP POLICY IF EXISTS "public delete" ON link_dashboard.links;

CREATE POLICY "public read"   ON link_dashboard.links FOR SELECT TO anon, authenticated USING (true);
CREATE POLICY "public insert" ON link_dashboard.links FOR INSERT TO anon, authenticated WITH CHECK (true);
CREATE POLICY "public update" ON link_dashboard.links FOR UPDATE TO anon, authenticated USING (true) WITH CHECK (true);
CREATE POLICY "public delete" ON link_dashboard.links FOR DELETE TO anon, authenticated USING (true);
