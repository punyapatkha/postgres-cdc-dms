-- -- Create a replication role for AWS DMS
-- CREATE ROLE dms_replication WITH REPLICATION LOGIN PASSWORD 'dms_pass';

-- -- Optionally grant privileges
-- GRANT CONNECT ON DATABASE cdc_db TO dms_replication;
-- GRANT USAGE ON SCHEMA public TO dms_replication;

CREATE EXTENSION IF NOT EXISTS pglogical;

GRANT CONNECT ON DATABASE postgres TO dms_user;
GRANT USAGE ON SCHEMA public TO dms_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO dms_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO dms_user;

-- For replication (optional, only for ongoing replication tasks)
ALTER ROLE dms_user WITH REPLICATION;
