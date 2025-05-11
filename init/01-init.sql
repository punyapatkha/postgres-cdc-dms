-- Create a replication role for AWS DMS
CREATE ROLE dms_replication WITH REPLICATION LOGIN PASSWORD 'dms_pass';

-- Optionally grant privileges
GRANT CONNECT ON DATABASE cdc_db TO dms_replication;
GRANT USAGE ON SCHEMA public TO dms_replication;
