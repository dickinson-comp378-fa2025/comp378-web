GRANT USAGE ON SCHEMA rp1fa2025 TO anon;
GRANT SELECT ON rp1fa2025.papers TO anon;
GRANT SELECT ON rp1fa2025.conferences TO anon;

GRANT INSERT ON rp1fa2025.papers TO anon;


-- show table policies
SELECT
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM
    pg_policies
WHERE
    schemaname = 'rp1fa2025'
    AND tablename = 'papers';